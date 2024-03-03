#!/usr/bin/env bash

set -ex
chmod +x install-istio.sh
./install-istio.sh
chmod +x install-prometheus-grafana.sh
./install-prometheus-grafana.sh
chmod +x install-code-server.sh
./install-code-server.sh
chmod +x deploy-app-bookinfo.sh
./deploy-app-bookinfo.sh
