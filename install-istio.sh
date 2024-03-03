#
# curl -L https://istio.io/downloadIstio | sh -

curl -L https://istio.io/downloadIstio | ISTIO_VERSION=1.20.3 TARGET_ARCH=x86_64 sh -

# bring istio to root space
sudo cp istio-1.20.3/bin/istioctl /usr/bin

# add istioctl to path
# export PATH=$PWD/bin:$PATH


#./istioctl install --set profile=demo -y

# https://discuss.istio.io/t/how-to-hold-a-application-until-proxy-starts/8346/4
# https://github.com/kubernetes/kubernetes/issues/107260
# need to fix istio-proxy readiness probe fail
istioctl install --set profile=demo -y --set meshConfig.defaultConfig.holdApplicationUntilProxyStarts=true

export KUBECONFIG=~/admin.conf
# alias kubectl='sudo k0s kubectl'
# configure istio to be enabled for default namespace
sudo k0s kubectl label namespace default istio-injection=enabled
# To uninstall istio
# ./istioctl uninstall --purge

# understanding dns  https://istio.io/v1.12/blog/2020/dns-proxy/

