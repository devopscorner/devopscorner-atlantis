#!/usr/bin/env sh

AWS_REGION=ap-southeast-3
AWS_ACCOUNT_ID=YOUR_AWS_ACCOUNT
EKS_CLUSTER=dci-eks

aws eks create-addon \
    --cluster-name ${EKS_CLUSTER} \
    --addon-name aws-ebs-csi-driver \
    --region ${AWS_REGION} \
    --service-account-role-arn arn:aws:iam::${AWS_ACCOUNT_ID}:role/AmazonEKS_EBS_CSI_DriverRole

aws eks describe-addon \
    --cluster-name ${EKS_CLUSTER} \
    --addon-name aws-ebs-csi-driver \
    --region ${AWS_REGION} \
    --query "addon.addonVersion" \
    --output text

aws eks describe-addon-versions \
    --addon-name aws-ebs-csi-driver \
    --kubernetes-version 1.32 \
    --region ${AWS_REGION} \
    --query "addons[].addonVersions[].[addonVersion, compatibilities[].defaultVersion]" \
    --output text

aws eks update-addon \
    --cluster-name ${EKS_CLUSTER} \
    --addon-name aws-ebs-csi-driver \
    --region ${AWS_REGION} \
    --addon-version v1.24.0-eksbuild.1 \
    --resolve-conflicts PRESERVE
