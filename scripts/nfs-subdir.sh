#!/usr/bin/env sh

AWS_REGION=ap-southeast-3
AWS_ACCOUNT_ID=112233445566
EKS_CLUSTER=dci-eks-staging

helm repo add nfs-subdir-external-provisioner https://kubernetes-sigs.github.io/nfs-subdir-external-provisioner
helm repo update
helm repo list

helm upgrade --install nfs-client nfs-subdir-external-provisioner/nfs-subdir-external-provisioner \
  --set nfs.server=fs-0bdc5e0a5f927e662.efs.$AWS_REGION.amazonaws.com \
  --set nfs.path=/ \
  --set storageClass.name=nfs-client \
  --set aws.region=$AWS_REGION \
  --set nodeSelector.node=dci-app
