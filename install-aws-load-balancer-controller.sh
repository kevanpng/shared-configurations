#!/usr/bin/env bash
set -ex

# https://artifacthub.io/packages/helm/aws/aws-load-balancer-controller
# Install the TargetGroupBinding CRDs:

# query imdsv1 for values # Will break once moved to IMDSV2
export INSTANCE_ID=$(curl http://169.254.169.254/latest/meta-data/instance-id)
export AZ=$(curl http://169.254.169.254/latest/meta-data/placement/availability-zone)

sudo k0s kubectl patch node $HOSTNAME -p '{"spec":{"providerID":"aws:///'${AZ}'/'${INSTANCE_ID}'"}}'
helm upgrade --install aws-load-balancer-controller ./aws-load-balancer-controller -n kube-system --set clusterName=k0s --set region=ap-southeast-1

#  * Internal error occurred: failed calling webhook "mservice.elbv2.k8s.aws": failed to call webhook: Post "https://aws-load-balancer-webhook-service.kube-system.svc:443/mutate-v1-service?timeout=10s": dial tcp 10.101.103.3:443: connect: connection refused
# helm -v 20 will show debug logs
