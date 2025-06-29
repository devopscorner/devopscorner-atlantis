# lambda/scheduler.py
import boto3
import json
import os
import logging
from datetime import datetime
import pytz
from typing import Dict, List, Optional, Any

# Configure logging
logger = logging.getLogger()
logger.setLevel(os.environ.get('LOG_LEVEL', 'INFO'))

class EC2SchedulerException(Exception):
    """Custom exception for EC2 Scheduler errors"""
    pass

class EC2Scheduler:
    def __init__(self):
        """Initialize the EC2 Scheduler with AWS clients"""
        self.ssm_client = boto3.client('ssm')
        self.sns_client = boto3.client('sns')
        self.sts_client = boto3.client('sts')
        self.region = os.environ['REGION']
        self.timezone = pytz.timezone(os.environ.get('TIMEZONE', 'Asia/Jakarta'))
        self.excluded_accounts = json.loads(os.environ.get('EXCLUDED_ACCOUNTS', '[]'))

    def get_schedule_config(self, account_id: str, environment: str) -> Dict:
        """Retrieve schedule configuration from SSM Parameter Store"""
        try:
            parameter_name = f"{os.environ['CONFIG_PREFIX']}/schedules/{account_id}/{environment}"
            response = self.ssm_client.get_parameter(
                Name=parameter_name,
                WithDecryption=True
            )
            return json.loads(response['Parameter']['Value'])
        except Exception as e:
            logger.error(f"Error retrieving configuration: {str(e)}")
            raise EC2SchedulerException(f"Configuration error: {str(e)}")

    def should_process_environment(self, schedule: Dict, current_time: datetime) -> Optional[str]:
        """Determine if the environment should be processed based on schedule"""
        local_time = current_time.astimezone(self.timezone)
        current_date = local_time.strftime('%Y-%m-%d')

        # Check exceptions
        if current_date in schedule.get('exceptions', []):
            logger.info(f"Date {current_date} is in exceptions list")
            return None

        # Check work days
        current_weekday = local_time.strftime('%a').upper()
        if current_weekday not in schedule['work_days']:
            logger.info(f"Day {current_weekday} is not in work days")
            return None

        # Check schedule times
        current_time_str = local_time.strftime('%H:%M')
        if current_time_str == schedule['start_time']:
            return 'start'
        elif current_time_str == schedule['stop_time']:
            return 'stop'

        return None

    def process_instances(self, ec2_client: Any, action: str, instance_tags: Dict) -> List[str]:
        """Process EC2 instances based on tags and action"""
        try:
            filters = [{'Name': f"tag:{k}", 'Values': [v]} for k, v in instance_tags.items()]
            filters.append({'Name': 'tag:Schedule', 'Values': ['True']})

            instances = ec2_client.describe_instances(Filters=filters)
            instance_ids = []

            for reservation in instances['Reservations']:
                for instance in reservation['Instances']:
                    state = instance['State']['Name']
                    if (action == 'start' and state == 'stopped') or \
                       (action == 'stop' and state == 'running'):
                        instance_ids.append(instance['InstanceId'])

            if instance_ids:
                if action == 'start':
                    ec2_client.start_instances(InstanceIds=instance_ids)
                    logger.info(f"Started instances: {instance_ids}")
                else:
                    ec2_client.stop_instances(InstanceIds=instance_ids)
                    logger.info(f"Stopped instances: {instance_ids}")

            return instance_ids

        except Exception as e:
            logger.error(f"Error processing instances: {str(e)}")
            raise EC2SchedulerException(f"Instance processing error: {str(e)}")

    def send_notification(self, topic_arn: str, subject: str, message: Dict):
        """Send SNS notification"""
        if os.environ.get('ENABLE_NOTIFICATIONS', 'true').lower() == 'true':
            try:
                self.sns_client.publish(
                    TopicArn=topic_arn,
                    Subject=subject,
                    Message=json.dumps(message, indent=2)
                )
                logger.info(f"Notification sent to {topic_arn}")
            except Exception as e:
                logger.error(f"Error sending notification: {str(e)}")

    def process_account(self, account_id: str, role_arn: str, environment: str, config: Dict) -> Dict:
        """Process EC2 instances for a specific account and environment"""
        try:
            assumed_role = self.sts_client.assume_role(
                RoleArn=role_arn,
                RoleSessionName=f'EC2Scheduler-{environment}'
            )

            ec2_client = boto3.client(
                'ec2',
                region_name=self.region,
                aws_access_key_id=assumed_role['Credentials']['AccessKeyId'],
                aws_secret_access_key=assumed_role['Credentials']['SecretAccessKey'],
                aws_session_token=assumed_role['Credentials']['SessionToken']
            )

            current_time = datetime.now(pytz.UTC)
            action = self.should_process_environment(config['schedule'], current_time)

            if action:
                instance_ids = self.process_instances(
                    ec2_client,
                    action,
                    config['schedule'].get('instance_tags', {})
                )

                return {
                    'account_id': account_id,
                    'environment': environment,
                    'action': action,
                    'instances': instance_ids,
                    'status': 'success',
                    'timestamp': current_time.isoformat()
                }

            return None

        except Exception as e:
            logger.error(f"Error processing account {account_id}: {str(e)}")
            return {
                'account_id': account_id,
                'environment': environment,
                'error': str(e),
                'status': 'failed',
                'timestamp': datetime.now(pytz.UTC).isoformat()
            }

def lambda_handler(event: Dict, context: Any) -> Dict:
    """Main Lambda handler"""
    scheduler = EC2Scheduler()

    try:
        accounts_param = scheduler.ssm_client.get_parameter(
            Name=f"{os.environ['CONFIG_PREFIX']}/accounts",
            WithDecryption=True
        )
        accounts = json.loads(accounts_param['Parameter']['Value'])

        results = []
        for account in accounts:
            if account['account_id'] in scheduler.excluded_accounts:
                logger.info(f"Skipping excluded account {account['account_id']}")
                continue

            for env in account['environments']:
                config = scheduler.get_schedule_config(account['account_id'], env)
                result = scheduler.process_account(
                    account['account_id'],
                    account['role_arn'],
                    env,
                    config
                )

                if result:
                    results.append(result)

                    # Send notification if configured
                    if 'notification_topic' in config:
                        scheduler.send_notification(
                            config['notification_topic'],
                            f"EC2 Scheduler - {env.upper()} Update",
                            result
                        )

        return {
            'statusCode': 200,
            'body': json.dumps(results)
        }

    except Exception as e:
        error_message = f"Error in scheduler execution: {str(e)}"
        logger.error(error_message)
        return {
            'statusCode': 500,
            'body': json.dumps({'error': error_message})
        }