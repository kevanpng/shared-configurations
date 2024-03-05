#!/usr/bin/env bash
set -ex

# https://artifacthub.io/packages/helm/aws/aws-load-balancer-controller
# Install the TargetGroupBinding CRDs:
helm upgrade -i aws-load-balancer-controller ./aws-load-balancer-controller -n kube-system --set clusterName=k0s --set region=ap-southeast-1 --set hostNetwork=true
# hostnetwork needed to solve the below error
#  * Internal error occurred: failed calling webhook "mservice.elbv2.k8s.aws": failed to call webhook: Post "https://aws-load-balancer-webhook-service.kube-system.svc:443/mutate-v1-service?timeout=10s": dial tcp 10.101.103.3:443: connect: connection refused
# helm -v 20 will show debug logs
