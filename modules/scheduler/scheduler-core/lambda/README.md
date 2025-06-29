# EC2 Scheduler for AWS Landing Zone

## Overview

The EC2 Scheduler is an automated solution for managing EC2 instances across multiple AWS accounts in a Landing Zone environment. It provides scheduled start/stop operations based on configured working hours, with support for different time zones, work days, and exceptions.

## Features

- Multi-account support with cross-account access
- Environment-specific scheduling (dev, staging, prod)
- Time zone awareness
- Configurable work days and hours
- Holiday and exception date handling
- SNS notifications for state changes
- Comprehensive logging and monitoring
- Terraform-managed infrastructure

## Prerequisites

- Python 3.9 or higher
- Terraform 1.0.0 or higher
- AWS CLI configured with appropriate credentials
- Make (for build automation)
- Virtual environment support

## Project Structure

```
.
├── lambda/
│   ├── scheduler.py
│   └── __init__.py
├── terraform/
│   ├── main.tf
│   ├── variables.tf
│   └── outputs.tf
├── tests/
│   └── test_scheduler.py
├── Makefile
├── README.md
└── requirements.txt
```

## Installation

1. Clone the repository:
```bash
git clone [repository-url]
cd ec2-scheduler
```

2. Initialize the development environment:
```bash
make init
```

3. Build the Lambda package:
```bash
make build
```

4. Deploy to AWS:
```bash
make deploy WORKSPACE=staging
```

## Configuration

### Environment Setup

Configure the scheduler using Terraform workspace variables:

```hcl
# terraform.tfvars
environment = {
  default = "DEF"
  lab     = "RND"
  staging = "STG"
  prod    = "PROD"
}
```

### Instance Tagging

Tag EC2 instances for scheduling:

```bash
aws ec2 create-tags \
    --resources i-1234567890abcdef0 \
    --tags Key=Schedule,Value=True Key=Environment,Value=staging
```

### Schedule Configuration

Configure schedules in SSM Parameter Store:

```json
{
  "schedule": {
    "start_time": "07:00",
    "stop_time": "19:00",
    "time_zone": "Asia/Jakarta",
    "work_days": ["MON", "TUE", "WED", "THU", "FRI"],
    "exceptions": ["2024-12-25"],
    "instance_tags": {
      "Environment": "staging"
    }
  }
}
```

## Usage

### Development

1. Run tests:
```bash
make test
```

2. Format code:
```bash
make format
```

3. Type checking:
```bash
make typecheck
```

### Deployment

Deploy to different environments:

```bash
# Deploy to staging
make deploy WORKSPACE=staging

# Deploy to production
make deploy WORKSPACE=prod
```

### Monitoring

Monitor scheduler operations through:

1. CloudWatch Logs:
   - /aws/lambda/ec2-scheduler-{environment}

2. SNS Notifications:
   - Topics: ec2-scheduler-notifications-{environment}

3. CloudWatch Metrics:
   - SchedulerInvocations
   - InstanceStateChanges
   - ErrorCount

## Troubleshooting

Common issues and solutions:

1. Cross-Account Access
   - Verify IAM role trust relationships
   - Check permission boundaries
   - Validate assume role configurations

2. Scheduling Issues
   - Confirm timezone settings
   - Verify tag configurations
   - Check exception dates

3. Notification Failures
   - Validate SNS topic policies
   - Check subscription status
   - Verify email configurations

## Contributing

1. Fork the repository
2. Create a feature branch
3. Commit changes
4. Create a pull request

## License