# Atlantis DCI (DevOpsCorner Indonesia) Terraform

Centralized IaC Tools Provisioning using Terraform

[![ask DeepWiki](https://deepwiki.com/badge.svg)](https://deepwiki.com/devopscorner/devopscorner-atlantis)
![all contributors](https://img.shields.io/github/contributors/devopscorner/devopscorner-atlantis)
![tags](https://img.shields.io/github/v/tag/devopscorner/devopscorner-atlantis?sort=semver)
![view](https://views.whatilearened.today/views/github/devopscorner/devopscorner-atlantis.svg)
![issues](https://img.shields.io/github/issues/devopscorner/devopscorner-atlantis)
![pull requests](https://img.shields.io/github/issues-pr/devopscorner/devopscorner-atlantis)
![forks](https://img.shields.io/github/forks/devopscorner/devopscorner-atlantis)
![stars](https://img.shields.io/github/stars/devopscorner/devopscorner-atlantis)
[![license](https://img.shields.io/github/license/devopscorner/devopscorner-atlantis)](https://img.shields.io/github/license/devopscorner/devopscorner-atlantis)

---

## Available Tags

### Alpine v3.22

| Image name | Size |
|------------|------|
| `devopscorner/devopscorner-atlantis:latest` | [![docker image size](https://img.shields.io/docker/image-size/devopscorner/devopscorner-atlantis/latest.svg?label=Image%20size&logo=docker)](https://hub.docker.com/repository/docker/devopscorner/devopscorner-atlantis/tags?page=1&ordering=last_updated&name=latest) ![default-latest](https://img.shields.io/static/v1?label=latest&message=default&color=brightgreen) ![latest](https://img.shields.io/static/v1?label=latest&message=alpine&color=orange) |
| `devopscorner/devopscorner-atlantis:alpine` | [![docker image size](https://img.shields.io/docker/image-size/devopscorner/devopscorner-atlantis/alpine.svg?label=Image%20size&logo=docker)](https://hub.docker.com/repository/docker/devopscorner/devopscorner-atlantis/tags?page=1&ordering=last_updated&name=alpine) ![latest](https://img.shields.io/static/v1?label=latest&message=alpine&color=orange) |
| `devopscorner/devopscorner-atlantis:alpine-latest` | [![docker image size](https://img.shields.io/docker/image-size/devopscorner/devopscorner-atlantis/alpine-latest.svg?label=Image%20size&logo=docker)](https://hub.docker.com/repository/docker/devopscorner/devopscorner-atlantis/tags?page=1&ordering=last_updated&name=alpine-latest) |

### Debian Bookworm

| Image name | Size |
|------------|------|
| `devopscorner/devopscorner-atlantis:debian` | [![docker image size](https://img.shields.io/docker/image-size/devopscorner/devopscorner-atlantis/debian.svg?label=Image%20size&logo=docker)](https://hub.docker.com/repository/docker/devopscorner/devopscorner-atlantis/tags?page=1&ordering=last_updated&name=debian) ![latest](https://img.shields.io/static/v1?label=latest&message=debian&color=orange) |
| `devopscorner/devopscorner-atlantis:debian-latest` | [![docker image size](https://img.shields.io/docker/image-size/devopscorner/devopscorner-atlantis/debian-latest.svg?label=Image%20size&logo=docker)](https://hub.docker.com/repository/docker/devopscorner/devopscorner-atlantis/tags?page=1&ordering=last_updated&name=debian-latest) |

### AWS Linux

| Image name | Size |
|------------|------|
| `devopscorner/devopscorner-atlantis:aws` | [![docker image size](https://img.shields.io/docker/image-size/devopscorner/devopscorner-atlantis/aws.svg?label=Image%20size&logo=docker)](https://hub.docker.com/repository/docker/devopscorner/devopscorner-atlantis/tags?page=1&ordering=last_updated&name=aws) ![latest](https://img.shields.io/static/v1?label=latest&message=aws&color=orange) |
| `devopscorner/devopscorner-atlantis:aws-latest` | [![docker image size](https://img.shields.io/docker/image-size/devopscorner/devopscorner-atlantis/aws-latest.svg?label=Image%20size&logo=docker)](https://hub.docker.com/repository/docker/devopscorner/devopscorner-atlantis/tags?page=1&ordering=last_updated&name=aws-latest) |

---

## Prerequirements

- Docker (`docker`)
- Docker Compose (`docker-compose`)

---

## AWS Control Tower

<div align="center">
    <img src="./docs/assets/ct-ou.svg" width="800px">
</div>


## AWS Organization

```
.
├── DCI-Management
│   ├── devopscorner-ct-log        (123456789012 | ct.logs@devopscorner.id)
│   ├── devopscorner-ct-management (112233445566 | ct.management@devopscorner.id)
│   └── devopscorner-ct-audit      (111122223333 | ct.audit@devopscorner.id)
└── DCI-OrganizationUnit
    ├── DCI-Billing
    │   └── devopscorner-billing   (444455556666 | ou.billing@devopscorner.id)
    ├── devopscorner-dev01         (098765432101 | dev01@devopscorner.id)
    ├── devopscorner-dev02         (555566667777 | dev02@devopscorner.id)
    ├── devopscorner-uat01         (888899990000 | uat01@devopscorner.id)
    ├── devopscorner-uat02         (123123123123 | uat02@devopscorner.id)
    ├── devopscorner-prod01        (456456456456 | prod01@devopscorner.id)
    └── devopscorner-prod02        (789789789789 | prod02@devopscorner.id)
```

## Terraform Centralized Provisioning

<div align="center">
    <img src="./docs/assets/tf-provisioning.svg" width="800px">
</div>

## Terraform Structure

```
tree -L 3    # three-levels show
---
.
├── LICENSE
├── README.md
├── atlantis.yaml
├── aws-session.sh
├── builder
│   ├── ATLANTIS-WORKSPACE.md
│   ├── Dockerfile
│   ├── Dockerfile-AWS-Python3.12
│   ├── Dockerfile-Alpine-3.22-Python3.12
│   ├── Dockerfile-Debian-Bookworm-Python3.12
│   ├── HOW-TO.md
│   ├── atlantis-nginx-basic-auth.conf
│   ├── atlantis-nginx.conf
│   ├── atlantis-v4.25.2.yaml
│   ├── config
│   │   ├── docker
│   │   └── k8s
│   ├── docker-compose.yml
│   ├── dockerhub-build.sh
│   ├── dockerhub-push.sh
│   ├── dockerhub-tag.sh
│   ├── ecr-build.sh
│   ├── ecr-pull.sh
│   ├── ecr-push.sh
│   ├── ecr-tag.sh
│   ├── git-clone.sh
│   ├── repo-v4.25.2.yaml
│   └── scripts
│       ├── atlantis-deploy
│       ├── download-release.sh
│       ├── init-atlantis
│       ├── install-atlantis-deploy
│       └── setup-basic-auth
├── docs
│   └── assets
│       ├── ct-billing.svg
│       ├── ct-ou.svg
│       ├── ct.svg
│       └── tf-provisioning.svg
├── environments
│   ├── ct
│   │   └── ct-management-112233445566
│   ├── dev
│   │   └── dev01-098765432101
│   └── uat
│       └── uat01-888899990000
├── gen-docs.sh
├── helm
│   ├── atlantis
│   │   ├── CODEOWNERS
│   │   ├── LICENSE
│   │   ├── Makefile
│   │   ├── README.md
│   │   ├── charts
│   │   └── ct.yaml
│   └── jumppod
│       ├── backend
│       └── stateful
├── manifest
│   ├── credentials-config.txt
│   ├── csi-driver
│   ├── eks-manifest
│   ├── helm-value-atlantis-nfs.yaml
│   ├── helm-value-jumppod-nfs.yaml
│   ├── manifest-configmap-atlantis-aws-config.yaml
│   ├── manifest-configmap-atlantis-aws-credentials.yaml
│   ├── manifest-configmap-atlantis-config.yaml
│   ├── manifest-configmap-atlantis-tf-config.yaml
│   ├── manifest-configmap-atlantis.yaml
│   ├── manifest-secretref-atlantis-aws.yaml
│   ├── manifest-secretref-atlantis-gh-vcs.yaml
│   ├── manifest-storage-class-aws copy.yaml
│   ├── manifest-storage-class-aws.yaml
│   └── secret
│       ├── aws-auth.txt
│       └── manifest-secret-http-auth.yaml
├── modules
│   ├── budget
│   ├── core-igw
│   ├── core-igw-ec2
│   ├── core-igw-eks
│   ├── core-nat
│   ├── core-nat-ec2
│   ├── core-nat-eks
│   ├── eks
│   ├── iam-tfuser-executor
│   ├── iam-user
│   ├── scheduler
│   │   ├── scheduler-config
│   │   ├── scheduler-core
│   │   └── scheduler-notifications
│   ├── storage-efs
│   ├── storage-s3
│   └── tfstate
├── repo.yaml
└── scripts
    ├── csi-driver.sh
    └── nfs-subdir.sh

45 directories, 249 files
```

## Atlantis Features

- Atlantis Container Builder Image
  - [Alpine v3.22](./builder/Dockerfile-Alpine-3.22-Python3.12)
  - [Debian Bookworm](./builder/Dockerfile-Debian-Bookworm-Python3.12)
  - [AWS Python-3.12](./builder/Dockerfile-AWS-Python3.12)
- Atlantis [Docker-Compose](./builder/docker-compose.yml)
- Atlantis Manifest [Helm Deployment](./manifest/helm-value-atlantis-nfs.yaml) for Kubernetes
- Atlantis Documentation with [![DeepWiki DevOpsCorner-Atlantis](https://deepwiki.com/badge.svg)](https://deepwiki.com/devopscorner/devopscorner-atlantis)
- Atlantis [Deployment Script](./builder/scripts/atlantis-deploy) Dynamic & Customize Workspace
- Production Grade [Modularity Terraform](./modules)

## Atlantis Environment Check (DEBUG)
```
🔍 Debug Information:
   PATH: /home/atlantis/bin:/home/atlantis/.local/share/pnpm:/home/atlantis/.nvm/versions/node/v20.19.3/bin:/home/atlantis/bin:/home/atlantis/.local/share/pnpm:/home/atlantis/.nvm/versions/node/v20.19.3/bin:/home/atlantis/.local/share/pnpm:/home/atlantis/.nvm/versions/node/v20.19.3/bin:/home/atlantis/.local/bin:/home/atlantis/.local/share/pnpm:/usr/local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/home/atlantis/.nvm/versions/node/v20/bin
   Current working directory: /home/atlantis
   Current user: atlantis (UID: 100, GID: 100)
🔍 Binary Discovery:
   Checking /usr/local/bin/ for tools...
-rwxr-xr-x 1 atlantis users 33013912 Nov 23  2024 atlantis
-rwxr-xr-x 1 root     root     29301 Jun 26 15:33 atlantis-deploy
-rwxr-xr-x 1 root     root      1128 Jun 26 15:29 install-atlantis-deploy
-rwxr-xr-x 1 root     root  89059480 Oct 16  2024 terraform
-rwxr-xr-x 1 root     root  90235032 Jan 22 23:45 terraform1.10.5
-rwxr-xr-x 1 root     root  90579096 Apr  9 20:03 terraform1.11.4
-rwxr-xr-x 1 root     root  81002496 Dec 14  2023 terraform1.6.6
-rwxr-xr-x 1 root     root  84525056 Mar 14  2024 terraform1.7.5
-rwxr-xr-x 1 root     root  88207512 Jun  5  2024 terraform1.8.5
-rwxr-xr-x 1 root     root  89059480 Oct 16  2024 terraform1.9.8
-rwxr-xr-x 1 root     root  96852811 Jun 27 08:14 terragrunt
-rwxr-xr-x 1 root     root  96852811 Jun 27 08:14 terragrunt0.70.4
-rwxr-xr-x 1 root     root  84988056 Nov 22  2024 tofu
-rwxr-xr-x 1 root     root  84988056 Nov 22  2024 tofu1.8.6

Verifying environment...
===============================================================================
 Atlantis Server:
   atlantis v0.31.0 (commit: 245044c) (build date: 2024-11-22T17:58:20.688Z)
===============================================================================
 Infrastructure as Code Tools:
   Terraform: Terraform v1.9.8
   Terragrunt: terragrunt version v0.70.4
   OpenTofu: OpenTofu v1.8.6
-------------------------------------------------------------------------------
 Development Tools:
   Node.js: v20.19.3
   NPM: 10.8.2
   PNPM: 10.12.4
   Python: Python 3.12.0
-------------------------------------------------------------------------------
 Container & System Tools:
 Docker socket exists but not accessible.
   Docker: Not available (no socket access)
   User: atlantis (UID: 100, GID: 100)
   Working Directory: /home/atlantis
   Environment: production
===============================================================================
Available tool versions:
└── Terraform versions:
    ├── terraform: v1.9.8
    ├── terraform1.10.5: v1.10.5
    ├── terraform1.11.4: v1.11.4
    ├── terraform1.6.6: v1.6.6
    ├── terraform1.7.5: v1.7.5
    ├── terraform1.8.5: v1.8.5
    ├── terraform1.9.8: v1.9.8
└── Terragrunt versions:
    ├── terragrunt: v0.70.4
    ├── terragrunt0.70.4: v0.70.4
└── OpenTofu versions:
    ├── tofu: v1.8.6
    ├── tofu1.8.6: v1.8.6
===============================================================================
🔍 Checking Terragrunt-Terraform compatibility...
   Terraform: v1.9.8
   Terragrunt: v0.70.4
   ✅ Terraform version meets minimum requirement (>= 1.9.8)
   ✅ Terragrunt version supports Terraform 1.9.8+
===============================================================================
🔍 About to execute: atlantis server

INF INF server/server.go:325 > INF INF server/server.go:325 > INF INF server/server.go:325 > INF INF server/server.go:325 > ts=2025-06-27T09:19:21.643+0700 INF INF server/server.go:325 > INF INF server/server.go:325 > INF INF server/server.go:325 > INF INF server/server.go:325 > ts=2025-06-27T09:19:21.643+0700 msg=Supported VCS Hosts: Github INF INF server/server.go:325 > INF INF server/server.go:325 > INF INF server/server.go:325 > INF INF server/server.go:325 > ts=2025-06-27T09:19:21.643+0700 INF INF server/server.go:325 > INF INF server/server.go:325 > INF INF server/server.go:325 > INF INF server/server.go:325 > ts=2025-06-27T09:19:21.643+0700 msg=Supported VCS Hosts: Github json={}
INF INF server/server.go:478 > INF INF server/server.go:478 > INF INF server/server.go:478 > INF INF server/server.go:478 > ts=2025-06-27T09:19:21.846+0700 INF INF server/server.go:478 > INF INF server/server.go:478 > INF INF server/server.go:478 > INF INF server/server.go:478 > ts=2025-06-27T09:19:21.846+0700 msg=Utilizing BoltDB INF INF server/server.go:478 > INF INF server/server.go:478 > INF INF server/server.go:478 > INF INF server/server.go:478 > ts=2025-06-27T09:19:21.846+0700 INF INF server/server.go:478 > INF INF server/server.go:478 > INF INF server/server.go:478 > INF INF server/server.go:478 > ts=2025-06-27T09:19:21.846+0700 msg=Utilizing BoltDB json={}
INF INF scheduled/executor_service.go:51 > INF INF scheduled/executor_service.go:51 > INF INF scheduled/executor_service.go:51 > INF INF scheduled/executor_service.go:51 > ts=2025-06-27T09:19:21.862+0700 INF INF scheduled/executor_service.go:51 > INF INF scheduled/executor_service.go:51 > INF INF scheduled/executor_service.go:51 > INF INF scheduled/executor_service.go:51 > ts=2025-06-27T09:19:21.862+0700 msg=Scheduled Executor Service started INF INF scheduled/executor_service.go:51 > INF INF scheduled/executor_service.go:51 > INF INF scheduled/executor_service.go:51 > INF INF scheduled/executor_service.go:51 > ts=2025-06-27T09:19:21.862+0700 INF INF scheduled/executor_service.go:51 > INF INF scheduled/executor_service.go:51 > INF INF scheduled/executor_service.go:51 > INF INF scheduled/executor_service.go:51 > ts=2025-06-27T09:19:21.862+0700 msg=Scheduled Executor Service started json={}
INF INF server/server.go:1048 > INF INF server/server.go:1048 > INF INF server/server.go:1048 > INF INF server/server.go:1048 > ts=2025-06-27T09:19:21.863+0700 INF INF server/server.go:1048 > INF INF server/server.go:1048 > INF INF server/server.go:1048 > INF INF server/server.go:1048 > ts=2025-06-27T09:19:21.863+0700 msg=Atlantis started - listening on port 4141 INF INF server/server.go:1048 > INF INF server/server.go:1048 > INF INF server/server.go:1048 > INF INF server/server.go:1048 > ts=2025-06-27T09:19:21.863+0700 INF INF server/server.go:1048 > INF INF server/server.go:1048 > INF INF server/server.go:1048 > INF INF server/server.go:1048 > ts=2025-06-27T09:19:21.863+0700 msg=Atlantis started - listening on port 4141 json={}
```

## Copyright

- Author: **DevOps Engineer (support@devopscorner.id)**
- Vendor: **DevOpsCorner Indonesia (devopscorner.id)**
- License: **Apache v2**
