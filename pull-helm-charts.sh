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
