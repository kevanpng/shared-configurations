#!/usr/bin/env bash
set -ex

# Create PV for code server PVC
sudo k0s kubectl apply -f code-server-pv.yaml


#helm upgrade --install code-server ./code-server \
#  --set service.type="NodePort"
  # --set service.port=30000 \

helm upgrade --install code-server ./code-server

# add gateway and vservice to code server
k apply -f code-server-gateway.yaml


export CODE_PASSWORD=$(sudo k0s kubectl get secret --namespace default code-server -o jsonpath="{.data.password}" | base64 --decode)
# export NODE_PORT=$(sudo k0s kubectl get --namespace default -o jsonpath="{.spec.ports[0].nodePort}" services code-server)
# custom PV for the code server, should have been created with helm
#kubectl apply -f pv.yaml

# TODO change the security group to allow from node port
# use public ip:node_port and give it the password to connect