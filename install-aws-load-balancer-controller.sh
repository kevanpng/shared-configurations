#!/usr/bin/env bash
set -ex

# https://artifacthub.io/packages/helm/aws/aws-load-balancer-controller
# Install the TargetGroupBinding CRDs:
sudo k0s kubectl apply -k "github.com/aws/eks-charts/stable/aws-load-balancer-controller//crds?ref=master"
helm upgrade -i aws-load-balancer-controller ./aws-load-balancer-controller -n kube-system --set clusterName=k0s
