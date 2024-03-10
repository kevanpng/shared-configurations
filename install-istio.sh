
export KUBECONFIG=~/admin.conf
sudo k0s kubectl apply -f istio-manifests.yaml

# alias kubectl='sudo k0s kubectl'
# configure istio to be enabled for default namespace
sudo k0s kubectl label namespace default istio-injection=enabled



