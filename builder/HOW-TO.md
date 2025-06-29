# Atlantis Dynamic Deployment System

A comprehensive, dynamic deployment system for managing multiple AWS environments using Atlantis and Terraform.

## 📋 Table of Contents

- [Overview](#overview)
- [Architecture](#architecture)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Configuration](#configuration)
- [Usage](#usage)
- [Troubleshooting](#troubleshooting)
- [Contributing](#contributing)

## 🏗️ Overview

This system provides a unified approach to managing Terraform deployments across multiple AWS environments using Atlantis. It supports:

- **6 Environments**: dev01-02, uat01-02, prod01-02,
- **Dynamic Configuration**: Single script handles all environments
- **GitHub Integration**: Secure submodule authentication
- **Multi-Account AWS**: Separate AWS profiles per environment

## 🎯 Architecture

```
┌───────────────────┐    ┌───────────────────┐    ┌─────────────────┐
│   GitHub PR       │    │    Atlantis       │    │  AWS Accounts   │
│                   │    │                   │    │                 │
│ ┌───────────────┐ │    │ ┌───────────────┐ │    │ ┌─────────────┐ │
│ │ dev01 branch. │ │───▶│ │atlantis-deploy│ │───▶│ │ DEV01 Acct  │ │
│ └───────────────┘ │    │ └───────────────┘ │    │ └─────────────┘ │
│ ┌───────────────┐ │    │ ┌───────────────┐ │    │ ┌─────────────┐ │
│ │ uat01 branch  │ │───▶│ │atlantis-deploy│ │───▶│ │ UAT01 Acct  │ │
│ └───────────────┘ │    │ └───────────────┘ │    │ └─────────────┘ │
│ ┌───────────────┐ │    │ ┌───────────────┐ │    │ ┌─────────────┐ │
│ │ prod01 branch │ │───▶│ │atlantis-deploy│ │───▶│ │ PROD01 Acct │ │
│ └───────────────┘ │    │ └───────────────┘ │    │ └─────────────┘ │
└───────────────────┘    └───────────────────┘    └─────────────────┘
```

## 📋 Prerequisites

### Required Software

- **Atlantis Server** v0.19.0+
- **Terraform** v1.5.0+
- **AWS CLI** v2.0+
- **Git** v2.30+
- **jq** v1.6+

### Required Accounts & Access

- **GitHub Account**: DevOpsCorner Indonesia bot account
- **AWS Accounts**: 6 separate AWS accounts (dev01-02, uat01-02, prod01-02)
- **Permissions**: Terraform deployment permissions in each AWS account

### Environment Variables

```bash
# GitHub Authentication
GITHUB_TOKEN="ghp_xxxxxxxxxxxxxxxxxxxx"
GITHUB_USERNAME="devopscorner"
GIT_USER_NAME="DevOpsCorner Indonesia"
GIT_USER_EMAIL="support@devopscorner.id"

# Atlantis Configuration
ATLANTIS_GH_TOKEN="$GITHUB_TOKEN"
ATLANTIS_GH_USER="devopscorner"
ATLANTIS_CONFIG_PATH="/atlantis/config"
```

## 🚀 Installation

### Step 1: Clone Repository

```bash
git clone https://github.com/devopscorner/devopscorner-atlantis.git
cd devopscorner-atlantis
```

### Step 2: Install System-Wide Script

```bash
# Make installation script executable
chmod +x install-atlantis-deploy

# Install as root/sudo
sudo ./install-atlantis-deploy
```

**Expected Output:**

```
🚀 Installing atlantis-deploy system-wide...
📋 Copying script to /usr/local/bin/atlantis-deploy...
🔧 Making script executable...
✅ atlantis-deploy installed successfully!
📍 Location: /usr/local/bin/atlantis-deploy
📖 Usage: atlantis-deploy <environment> <workspace> [plan|apply]
💡 Example: atlantis-deploy dev01 default plan
🔍 Testing installation...
atlantis-deploy v1.0.0
```

### Step 3: Verify Installation

```bash
# Check version
atlantis-deploy --version

# Show help
atlantis-deploy --help

# Test with environment
atlantis-deploy dev01 default --help
```

## ⚙️ Configuration

### Directory Structure

```
repository/
├── scripts/
│   ├── atlantis-deploy                 # Source script
│   └── install-atlantis-deploy         # Installation script
├── atlantis.yaml                       # Project configuration
├── repo.yaml                           # Repository workflows
├── README.md                           # This documentation
└── /atlantis/config/                   # Configuration files
    ├── dev01/
    │   ├── backend.tf
    │   ├── backend.tfvars
    │   └── dev01.tfvars
    ├── dev02/
    │   ├── backend.tf
    │   ├── backend.tfvars
    │   └── dev02.tfvars
    ├── uat01/
    │   ├── backend.tf
    │   ├── backend.tfvars
    │   └── uat01.tfvars
    ├── uat02/
    │   ├── backend.tf
    │   ├── backend.tfvars
    │   └── uat02.tfvars
    ├── prod01/
    │   ├── backend.tf
    │   ├── backend.tfvars
    │   └── prod01.tfvars
    └── prod02/
        ├── backend.tf
        ├── backend.tfvars
        └── prod02.tfvars
```

### Environment Configuration

Each environment requires three configuration files:

#### backend.tf

```hcl
terraform {
  backend "s3" {
    region         = "ap-southeast-3"
    bucket         = "tf-state-${AWS_ACCOUNT_ID}-ap-southeast-3"
    dynamodb_table = "ddb-tf-state-${AWS_ACCOUNT_ID}-ap-southeast-3"
    key            = "devopscorner/${AWS_ACCOUNT_ID}/atlantis/tfstate"
    encrypt        = true
  }
}
```

#### backend.tfvars

```hcl
region         = "ap-southeast-3"
bucket         = "tf-state-${AWS_ACCOUNT_ID}-ap-southeast-3"
dynamodb_table = "ddb-tf-state-${AWS_ACCOUNT_ID}-ap-southeast-3"
key            = "devopscorner/${AWS_ACCOUNT_ID}/atlantis/tfstate"
encrypt        = true
```

#### dev01.tfvars

```hcl
region="ap-southeast-3"
common-tags={
  "Owner"="DCI"
  "Environment"="STAGING"
}
ses-source-email="support@devopscorner.id"
```

### AWS Profile Configuration

Configure AWS profiles in `~/.aws/config`:

```ini
[profile DCI-TF-User-Executor-DEV01]
region = ap-southeast-3
role_arn = arn:aws:iam::ACCOUNT-ID:role/TerraformExecutionRole
source_profile = default

[profile DCI-TF-User-Executor-DEV02]
region = ap-southeast-3
role_arn = arn:aws:iam::ACCOUNT-ID:role/TerraformExecutionRole
source_profile = default

# ... continue for all environments
```

## 🎮 Usage

### Command Line Interface

```bash
# Basic usage
atlantis-deploy <environment> <workspace> [operation]

# Available environments
dev01, dev02, dev03, dev04, uat01, uat02, prod01, prod02

# Available operations
plan, apply (default: plan)
```

### Examples

#### Plan Deployment

```bash
# Plan deployment for dev01
atlantis-deploy dev01 default plan

# Plan deployment for uat02
atlantis-deploy uat02 default plan

# Plan deployment (default operation)
atlantis-deploy dev03 default
```

#### Apply Deployment

```bash
# Apply deployment for dev01
atlantis-deploy dev01 default apply

# Apply deployment for prod02
atlantis-deploy prod02 default apply
```

#### Help and Version

```bash
# Show help
atlantis-deploy --help

# Show version
atlantis-deploy --version

# Environment-specific help
atlantis-deploy dev01 default --help
```

### Atlantis Integration

#### Through Pull Requests

1. **Create Branch**: Create a branch matching your environment

   ```bash
   git checkout -b dev01
   # Make your changes
   git commit -m "Update dev01 infrastructure"
   git push origin dev01
   ```

2. **Create Pull Request**: Open PR against main branch

3. **Atlantis Commands**: Use Atlantis commands in PR comments
   ```
   atlantis plan -p dci-dev01
   atlantis apply -p dci-dev01
   ```

#### Automatic Triggers

Atlantis automatically triggers on changes to:

- `*.tf` files
- `*.tfvars` files
- `*.hcl` files
- `modules/**/*.tf` files
- `.terraform.lock.hcl`

### Environment-Specific Workflows

Each environment has its dedicated workflow:

| Environment | Workflow                | AWS Account | Region         |
| ----------- | ----------------------- | ----------- | -------------- |
| dev01       | dev01-default-workflow  | DEV01       | ap-southeast-3 |
| dev02       | dev02-staging-workflow  | DEV02       | ap-southeast-3 |
| uat01       | uat01-default-workflow  | UAT01       | ap-southeast-3 |
| uat02       | uat02-staging-workflow  | UAT02       | ap-southeast-3 |
| prod01      | prod01-workflow         | PROD01      | ap-southeast-3 |
| prod02      | prod02-workflow         | PROD02      | ap-southeast-3 |

## 🔧 Troubleshooting

### Common Issues

#### 1. GitHub Authentication Failed

**Error**: `fatal: could not read Username for 'https://github.com'`

**Solution**:

```bash
# Check GitHub token
echo $GITHUB_TOKEN

# Test GitHub access
git ls-remote https://github.com/devopscorner/report_templates.git

# Verify DevOpsCorner Indonesia has repository access
```

#### 2. AWS Authentication Failed

**Error**: `AWS credential validation failed`

**Solution**:

```bash
# Check AWS profile
aws configure list-profiles

# Test AWS access
aws sts get-caller-identity --profile DCI-TF-User-Executor-DEV01

# Verify IAM role permissions
```

#### 3. Configuration Files Not Found

**Error**: `Configuration file not found: /atlantis/config/dev01/backend.tf`

**Solution**:

```bash
# Check configuration directory
ls -la /atlantis/config/dev01/

# Verify file permissions
ls -la /atlantis/config/dev01/*.tf*

# Check ATLANTIS_CONFIG_PATH
echo $ATLANTIS_CONFIG_PATH
```

#### 4. Submodule Initialization Failed

**Error**: `Submodule initialization failed`

**Solution**:

```bash
# Check submodule configuration
cat .gitmodules

# Test submodule access
git submodule status

# Manual submodule update
git submodule update --init --recursive --progress
```

### Debug Mode

Enable debug mode for detailed logging:

```bash
# Set debug environment variable
export ATLANTIS_DEBUG=true

# Run with verbose output
atlantis-deploy dev01 default plan 2>&1 | tee debug.log
```

### Log Analysis

Check Atlantis logs for issues:

```bash
# View Atlantis server logs
kubectl logs -f deployment/atlantis

# Check specific workflow logs
kubectl logs -f deployment/atlantis | grep "dev01-default-workflow"
```

## 🔐 Security Considerations

### Secrets Management

1. **GitHub Token**: Store in Kubernetes secrets
2. **AWS Credentials**: Use IAM roles, not access keys
3. **Terraform State**: Encrypted S3 backend with DynamoDB locking

### Access Control

1. **Branch Protection**: Require PR approval
2. **RBAC**: Role-based access to Atlantis
3. **MFA**: Multi-factor authentication for AWS

### Audit Trail

1. **CloudTrail**: All AWS API calls logged
2. **Git History**: All infrastructure changes tracked
3. **Atlantis Logs**: All deployment activities logged

## 🛠️ Maintenance

### Updating the Script

```bash
# Update source script
vim scripts/atlantis-deploy

# Reinstall system-wide
sudo ./install-atlantis-deploy

# Verify update
atlantis-deploy --version
```

### Adding New Environments

1. **Create Configuration Directory**:

   ```bash
   mkdir -p /atlantis/config/dev03
   ```

2. **Add Configuration Files**:

   ```bash
   # Copy from existing environment
   cp /atlantis/config/dev01/* /atlantis/config/dev03/

   # Update environment-specific values
   vim /atlantis/config/dev03/dev03.tfvars
   ```

3. **Update Atlantis Configuration**:

   ```yaml
   # Add to atlantis.yaml
   - name: dci-dev03
     branch: /dev03/
     workflow: dev03-default-workflow
   ```

4. **Update Repo Configuration**:
   ```yaml
   # Add to repo.yaml
   dev03-default-workflow:
     plan:
       steps:
         - run: atlantis-deploy dev03 default plan
   ```

### Monitoring

Monitor deployment health:

```bash
# Check system status
atlantis-deploy --version

# Test all environments
for env in dev01 dev02 dev03 uat01 uat02 prod01 prod02; do
  echo "Testing $env..."
  atlantis-deploy $env --help
done
```

## 📚 Advanced Usage

### Custom Environment Variables

```bash
# Override default configuration
export ATLANTIS_CONFIG_PATH="/custom/config/path"
export GIT_USER_NAME="Custom Bot"
export GIT_USER_EMAIL="custom-bot@company.com"

# Run with custom settings
atlantis-deploy dev01 default plan
```

### Batch Operations

```bash
#!/bin/bash
# batch-deploy.sh

environments=("dev01" "dev02" "dev03")

for env in "${environments[@]}"; do
  echo "Planning $env..."
  atlantis-deploy "$env" plan
done
```

### Integration with CI/CD

```yaml
# .github/workflows/atlantis-check.yml
name: Atlantis Configuration Check

on:
  pull_request:
    paths:
      - "atlantis.yaml"
      - "repo.yaml"
      - "scripts/atlantis-deploy"

jobs:
  check:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - name: Install atlantis-deploy
        run: sudo ./install-atlantis-deploy
      - name: Test script
        run: atlantis-deploy --version
```

## 🤝 Contributing

### Development Setup

```bash
# Clone repository
git clone https://github.com/devopscorner/devopscorner-atlantis.git

# Create feature branch
git checkout -b feature/new-enhancement

# Make changes
vim scripts/atlantis-deploy

# Test changes
./scripts/atlantis-deploy dev01 default plan

# Commit and push
git commit -m "Add new enhancement"
git push origin feature/new-enhancement
```

### Testing

```bash
# Run tests
./scripts/test-atlantis-deploy.sh

# Lint script
shellcheck scripts/atlantis-deploy

# Test installation
sudo ./install-atlantis-deploy
```

### Code Style

- Use `set -euo pipefail` for error handling
- Include comprehensive logging
- Follow bash best practices
- Add comments for complex logic

## 📞 Support

### Contact Information

- **Team**: DevOpsCorner Indonesia
- **Email**: support@devopscorner.id
- **Repository**: [DevOpsCorner-Atlantis](https://github.com/devopscorner/devopscorner-atlantis)

### Documentation

- [Atlantis Documentation](https://www.runatlantis.io/docs/)
- [Terraform Documentation](https://www.terraform.io/docs/)
- [AWS CLI Documentation](https://docs.aws.amazon.com/cli/)

### Community

- [DORA Community](https://dora.community)
- [DevOps Indonesia](https://www.devops.id/)
- [AWS User Group Indonesia](https://www.meetup.com/AWS-User-Group-Indonesia/)

---

## 📄 License

This project is licensed under _Apache v2_ - see the [LICENSE](../LICENSE) file for details.

## 🙏 Acknowledgments

- **DORA Research**: For DevOps metrics and best practices
- **OpenTelemetry Community**: For observability standards
- **Atlantis Team**: For the excellent GitOps tool
- **Xapiens Team**: For the Xignals observability platform

---

**Made with ❤️ by the DevOpsCorner Indonesia Team**