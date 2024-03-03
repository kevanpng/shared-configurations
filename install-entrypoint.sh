#!/usr/bin/env bash

set -ex

./install-istio.sh
./install-code-server.sh
./deploy-app-bookinfo.sh
