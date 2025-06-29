# Atlantis Workspace Management Guide

## Overview

This guide covers the refactored Atlantis deployment pattern that now includes workspace management. The new pattern provides better isolation, parallel deployments, and enhanced DevOps workflow support.

## New Command Pattern

```bash
atlantis-deploy <environment> <workspace> [operation]
```

### Parameters

-  **environment**: Target environment (dev01-dev05, uat01-uat05, prod01-prod05)
-  **workspace**: Terraform workspace name (default, staging, production, custom names)
-  **operation**: Operation to perform (plan, apply) [default: plan]

## Usage Examples

### Basic Operations

```bash
# Plan deployment for dev01 with default workspace
atlantis-deploy dev01 default plan

# Apply deployment for uat02 with staging workspace
atlantis-deploy uat02 staging apply

# Plan deployment for prod01 with production workspace
atlantis-deploy prod01 production plan
```

### Feature Development

```bash
# Create feature workspace for development
atlantis-deploy dev01 feature-auth-system plan
atlantis-deploy dev01 feature-auth-system apply

# Create bugfix workspace
atlantis-deploy dev02 bugfix-login-issue plan
atlantis-deploy dev02 bugfix-login-issue apply
```

### Environment Promotion

```bash
# Development to staging promotion
atlantis-deploy dev01 default plan
atlantis-deploy dev01 staging plan

# Staging to production promotion
atlantis-deploy uat01 staging plan
atlantis-deploy prod01 production plan
```

## Workspace Strategy

### Standard Workspaces

| Workspace    | Purpose                    | Environments     |
| ------------ | -------------------------- | ---------------- |
| `default`    | Main development workspace | All environments |
| `staging`    | Pre-production testing     | dev*, uat*       |
| `production` | Production deployments     | prod\*           |
| `feature-*`  | Feature development        | dev\*            |
| `bugfix-*`   | Bug fixes                  | dev*, uat*       |
| `hotfix-*`   | Emergency fixes            | prod\*           |

### Workspace Naming Conventions

-  **Feature branches**: `feature-<feature-name>`
-  **Bug fixes**: `bugfix-<issue-id>`
-  **Hotfixes**: `hotfix-<issue-id>`
-  **Release candidates**: `rc-<version>`
-  **Custom**: Any valid terraform workspace name

## Atlantis Configuration

### Project Configuration

The Atlantis configuration now supports multiple workspace combinations:

```yaml
projects:
   - name: dci-dev01-default
     branch: /dev01/
     workspace: default
     workflow: dev01-default-workflow

   - name: dci-dev01-staging
     branch: /dev01/
     workspace: staging
     workflow: dev01-staging-workflow
```

### Workflow Configuration

Each environment-workspace combination has its own workflow:

```yaml
workflows:
   dev01-default-workflow:
      plan:
         steps:
            - run: atlantis-deploy dev01 default plan
      apply:
         steps:
            - run: atlantis-deploy dev01 default apply
```

## Benefits of the New Pattern

### 1. **Workspace Isolation**

-  Multiple parallel deployments per environment
-  Safe testing of infrastructure changes
-  Resource isolation between features

### 2. **Enhanced CI/CD Integration**

-  Better support for GitFlow workflows
-  Automated workspace creation for feature branches
-  Simplified environment promotion

### 3. **Improved DevOps Practices**

-  Clear separation of concerns
-  Better rollback capabilities
-  Enhanced testing strategies

### 4. **Scalability**

-  Support for multiple teams
-  Parallel development workflows
-  Resource optimization

## Terraform Workspace Management

### Automatic Workspace Creation

The script automatically creates workspaces if they don't exist:

```bash
# If 'feature-auth' workspace doesn't exist, it will be created
atlantis-deploy dev01 feature-auth plan
```

### Workspace Validation

The script validates workspace names to ensure compatibility:

-  Only alphanumeric characters, hyphens, and underscores
-  Maximum 90 characters length
-  No special characters that could cause issues

### Workspace State Management

Each workspace maintains its own state file, providing:

-  Independent resource tracking
-  Isolated state management
-  Safe parallel operations

## Best Practices

### 1. **Workspace Lifecycle**

```bash
# Create and plan
atlantis-deploy dev01 feature-new-api plan

# Apply changes
atlantis-deploy dev01 feature-new-api apply

# Test and validate
# ... testing process ...

# Promote to staging
atlantis-deploy dev01 staging plan
atlantis-deploy dev01 staging apply

# Clean up feature workspace (manual step)
terraform workspace select default
terraform workspace delete feature-new-api
```

### 2. **Environment Promotion Strategy**

```bash
# Development -> Staging -> Production flow
atlantis-deploy dev01 default plan     # Develop
atlantis-deploy dev01 staging plan     # Stage
atlantis-deploy uat01 staging plan     # UAT
atlantis-deploy prod01 production plan # Production
```

### 3. **Parallel Development**

```bash
# Team A working on authentication
atlantis-deploy dev01 feature-auth plan

# Team B working on payments
atlantis-deploy dev02 feature-payments plan

# Team C working on reporting
atlantis-deploy dev03 feature-reports plan
```

## Migration from Old Pattern

### Step 1: Update Scripts

Replace existing `atlantis-deploy` script with the new version that supports the workspace parameter.

### Step 2: Update Atlantis Configuration

Update your `atlantis.yaml` to include workspace specifications for each project.

### Step 3: Update Repository Configuration

Update your `repo.yaml` to include new workflows that call the script with the workspace parameter.

### Step 4: Update CI/CD Pipelines

Update any CI/CD pipelines or automation that calls `atlantis-deploy` to include the workspace parameter.

### Backward Compatibility

The new script maintains backward compatibility by:

-  Defaulting to `plan` operation if not specified
-  Providing clear error messages for missing parameters
-  Supporting all existing environment names

## Troubleshooting

### Common Issues

1. **Workspace Creation Fails**

   ```bash
   # Check if workspace name is valid
   echo $WORKSPACE | grep -E '^[a-zA-Z0-9_-]+$'

   # Check workspace name length
   echo ${#WORKSPACE}
   ```

2. **Terraform State Issues**

   ```bash
   # List all workspaces
   terraform workspace list

   # Show current workspace
   terraform workspace show

   # Switch to default workspace
   terraform workspace select default
   ```

3. **AWS Credential Issues**

   ```bash
   # Verify AWS profile
   aws sts get-caller-identity --profile $AWS_PROFILE

   # Check environment variables
   env | grep AWS
   ```

### Debug Mode

Enable debug logging by setting environment variables:

```bash
export TF_LOG=DEBUG
export ATLANTIS_LOG_LEVEL=debug
atlantis-deploy dev01 default plan
```

## Environment Variables

### Required Variables

-  `GITHUB_TOKEN`: GitHub Personal Access Token
-  `AWS_PROFILE`: AWS profile for authentication

### Optional Variables

-  `GIT_USER_NAME`: Git commit author name (default: devopscorner)
-  `GIT_USER_EMAIL`: Git commit author email
-  `GITHUB_USERNAME`: GitHub username for authentication
-  `ATLANTIS_CONFIG_PATH`: Config path (default: /atlantis/config)
-  `SCRIPT_RUN_TEST`: Enable/disable test execution (default: false)

## Integration Examples

### GitLab CI/CD

```yaml
stages:
   - plan
   - apply

terraform-plan:
   stage: plan
   script:
      - atlantis-deploy $CI_COMMIT_REF_NAME default plan

terraform-apply:
   stage: apply
   script:
      - atlantis-deploy $CI_COMMIT_REF_NAME default apply
   when: manual
```

### GitHub Actions

```yaml
name: Terraform Deploy

on:
   pull_request:
      branches: [dev01, dev02, dev03]

jobs:
   terraform:
      runs-on: ubuntu-latest
      steps:
         - uses: actions/checkout@v3
         - name: Plan Terraform
           run: atlantis-deploy ${{ github.head_ref }} default plan
```

### Jenkins Pipeline

```groovy
pipeline {
    agent any
    stages {
        stage('Plan') {
            steps {
                sh "atlantis-deploy ${env.BRANCH_NAME} default plan"
            }
        }
        stage('Apply') {
            steps {
                sh "atlantis-deploy ${env.BRANCH_NAME} default apply"
            }
        }
    }
}
```

## Support and Maintenance

### Script Version Management

The script includes version information:

```bash
atlantis-deploy --version
```

### Health Checks

Regular health checks for the deployment system:

```bash
# Test GitHub connectivity
atlantis-deploy dev01 default --test-github

# Test AWS connectivity
atlantis-deploy dev01 default --test-aws

# Validate configuration
atlantis-deploy dev01 default --validate-config
```

### Monitoring and Logging

Monitor deployments using:

-  CloudWatch Logs for AWS operations
-  Atlantis web UI for deployment status
-  GitHub/GitLab webhook logs for integration status
