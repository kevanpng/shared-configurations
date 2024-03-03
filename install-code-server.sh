#!/usr/bin/env bash
set -ex

# Create PV for code server PVC
sudo k0s kubectl apply -f code-server-pv.yaml

git clone https://github.com/coder/code-server


helm upgrade --install code-server code-server/ci/helm-chart \
  --set service.type="NodePort"
#  --set persistence.enabled=true \

  # --set service.port=30000 \

#



export CODE_PASSWORD=$(sudo k0s kubectl get secret --namespace default code-server -o jsonpath="{.data.password}" | base64 --decode)
export NODE_PORT=$(sudo k0s kubectl get --namespace default -o jsonpath="{.spec.ports[0].nodePort}" services code-server)
# custom PV for the code server, should have been created with helm
#kubectl apply -f pv.yaml

# TODO change the security group to allow from node port
# use public ip:node_port and give it the password to connect