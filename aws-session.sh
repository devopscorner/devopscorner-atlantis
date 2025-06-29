#!/usr/bin/env sh

set -euxo pipefail

aws_profile="DCI-TF-User-Executor"
aws_role_arn="arn:aws:iam::112233445566:role/TF-Central-Role"

echo "AWS Access Key:"
aws configure get aws_access_key_id --profile ${aws_profile}

echo "AWS Secret Key:"
aws configure get aws_secret_access_key --profile ${aws_profile}

echo "AWS Session Token:"
aws configure get aws_session_token --profile ${aws_profile}

echo ""
echo "export AWS_PROFILE=${aws_profile}"
export AWS_PROFILE=${aws_profile}
echo "export AWS_ROLE_ARN=${aws_role_arn}"
export AWS_ROLE_ARN=${aws_role_arn}
