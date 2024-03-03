set -ex

# Check if this is required
#alias kubectl='sudo k0s kubectl'

## add helm repo for kube-prom, get the whole chart locally to put under version control
#helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
#helm repo update
#{ # try
#
#    helm pull prometheus-community/kube-prometheus-stack --untar --version 56.8.0
#    #save your output
#} || { # catch
#    echo 'helm pull failed'
#    # save log for exception
#}

# helm upgrade -f myvalues.yaml -f override.yaml redis ./redis
helm upgrade -f ./kube-prometheus-stack/values.yaml kube-prometheus-stack ./kube-prometheus-stack --install --create-namespace --namespace monitoring


# To remove
# helm uninstall kube-prometheus-stack
