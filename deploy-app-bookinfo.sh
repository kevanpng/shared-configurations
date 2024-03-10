export KUBECONFIG=~/admin.conf

sudo k0s kubectl apply -f ./bookinfo/bookinfo.yaml

# apply istio gateway and virtual service
sudo k0s kubectl apply -f ./bookinfo/bookinfo-gateway.yaml

# Check for validation issues after deploying gateway and Vservice
istioctl analyze

# check ip of istio ingress gateway. It is a Load balancer type Service
sudo k0s kubectl get svc istio-ingressgateway -n istio-system
