export KUBECONFIG=~/admin.conf
sudo k0s kubectl apply -f metalb.yaml
sudo k0s kubectl apply -f metallb-l2-pool.yaml


