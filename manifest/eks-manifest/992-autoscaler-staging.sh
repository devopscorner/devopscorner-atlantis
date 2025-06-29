#!/usr/bin/env sh

export AWS_REGION="ap-southeast-3"
export ACCOUNT_ID="112233445566"
export EKS_CLUSTER="dci-eks-staging"
export EKS_VPC_ID="vpc-0ee08f6bf1c3840a9"
export AUTOSCALLER_VERSION="1.30.1"
export SSL_CERT_ARN="arn:aws:acm:${AWS_REGION}:${ACCOUNT_ID}:certificate/HASH_NUMBER"

kubectl config use-context arn:aws:eks:ap-southeast-3:${ACCOUNT_ID}:cluster/${EKS_CLUSTER}

kubectl apply -f https://raw.githubusercontent.com/kubernetes/autoscaler/master/cluster-autoscaler/cloudprovider/aws/examples/cluster-autoscaler-autodiscover.yaml

# Create a patch file with placeholders
cat <<EOF > patch-file.json
{
    "spec": {
        "template": {
            "metadata": {
                "annotations": {
                    "cluster-autoscaler.kubernetes.io/safe-to-evict": "false"
                }
            },
            "spec": {
                "containers": [
                    {
                        "image": "registry.k8s.io/autoscaling/cluster-autoscaler:v\${AUTOSCALLER_VERSION}",
                        "name": "cluster-autoscaler",
                        "resources": {
                            "limits": {
                                "cpu": "300m",
                                "memory": "600Mi"
                            },
                            "requests": {
                                "cpu": "100m",
                                "memory": "300Mi"
                            }
                        },
                        "env": [
                            {
                                "name": "AWS_STS_REGIONAL_ENDPOINTS",
                                "value": "regional"
                            },
                            {
                                "name": "AWS_DEFAULT_REGION",
                                "value": "$AWS_REGION"
                            },
                            {
                                "name": "AWS_REGION",
                                "value": "$AWS_REGION"
                            },
                            {
                                "name": "AWS_ROLE_ARN",
                                "value": "arn:aws:iam::$ACCOUNT_ID:role/cluster-autoscaler-dci-eks-staging-role"
                            }
                        ],
                        "command": [
                            "./cluster-autoscaler",
                            "--v=4",
                            "--stderrthreshold=info",
                            "--cloud-provider=aws",
                            "--skip-nodes-with-local-storage=false",
                            "--expander=least-waste",
                            "--node-group-auto-discovery=asg:tag=k8s.io/cluster-autoscaler/enabled,k8s.io/cluster-autoscaler/dci-eks-staging",
                            "--balance-similar-node-groups",
                            "--skip-nodes-with-system-pods=false"
                        ]
                    }
                ]
            }
        }
    }
}
EOF

# Substitute the environment variable in the patch file
envsubst < patch-file.json | kubectl -n kube-system patch deployment cluster-autoscaler --patch "$(cat -)"

kubectl patch ServiceAccount cluster-autoscaler -n kube-system --patch '{"metadata":{"annotations":{"eks.amazonaws.com/role-arn": "arn:aws:iam::112233445566:role/cluster-autoscaler-dci-eks-staging-role"}}}'

kubectl apply -f 09-metrics-server.yaml
