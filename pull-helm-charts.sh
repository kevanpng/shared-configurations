#!/usr/bin/env bash

#### kube-prometheus
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
helm pull prometheus-community/kube-prometheus-stack --untar --version 56.8.0

#### Aws load balancer controller
helm repo add eks https://aws.github.io/eks-charts
helm pull eks/aws-load-balancer-controller --untar --version 1.7.1

#### code server
git clone https://github.com/coder/code-server

#### ISTIO
#./istioctl install --set profile=demo -y

# https://discuss.istio.io/t/how-to-hold-a-application-until-proxy-starts/8346/4
# https://github.com/kubernetes/kubernetes/issues/107260
# need to fix istio-proxy readiness probe fail
#  istioctl install --set profile=demo -y --set meshConfig.defaultConfig.holdApplicationUntilProxyStarts=true
# https://istio.io/latest/docs/reference/commands/istioctl/#istioctl-install
# https://istio.io/v1.14/blog/2018/aws-nlb/
#istioctl install -y --filename istio-values.yaml

#istioctl manifest generate --filename istio-values.yaml
curl -L https://istio.io/downloadIstio | ISTIO_VERSION=1.20.3 TARGET_ARCH=x86_64 sh -

# bring istio to root space
sudo cp istio-1.20.3/bin/istioctl /usr/bin

istioctl manifest generate --filename istio-values.yaml
# To uninstall istio
# ./istioctl uninstall --purge
# understanding dns  https://istio.io/v1.12/blog/2020/dns-proxy/


