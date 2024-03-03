export KUBECONFIG=~/admin.conf
alias kubectl='sudo k0s kubectl'

kubectl apply -f ./apps/bookinfo/bookinfo.yaml

# apply istio gateway and virtual service
kubectl apply -f ./apps/bookinfo/bookinfo-gateway.yaml

# Check for validation issues after deploying gateway and Vservice
istioctl analyze

# check ip of istio ingress gateway. It is a Load balancer type Service
kubectl get svc istio-ingressgateway -n istio-system
