#!/usr/bin/env bash
set -ex

# https://artifacthub.io/packages/helm/aws/aws-load-balancer-controller
# Install the TargetGroupBinding CRDs:
helm upgrade -i aws-load-balancer-controller ./aws-load-balancer-controller -n kube-system --set clusterName=k0s
