#!/usr/bin/env sh

AWS_REGION=ap-southeast-3
AWS_ACCOUNT_ID=YOUR_AWS_ACCOUNT
EKS_CLUSTER=dci-eks

kubectl config use-context arn:aws:eks:${AWS_REGION}:${ACCOUNT_ID}:cluster/${EKS_CLUSTER}

helm repo add aws-ebs-csi-driver https://kubernetes-sigs.github.io/aws-ebs-csi-driver
helm repo update

helm upgrade --install aws-ebs-csi-driver \
    --namespace kube-system \
    aws-ebs-csi-driver/aws-ebs-csi-driver

kubectl get pods -n kube-system -l app.kubernetes.io/name=aws-ebs-csi-driver
