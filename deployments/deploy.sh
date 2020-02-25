#!/bin/bash

set -e

info() {
    echo '[INFO] ' "$@"
}

deploy_k3s() {
    export INSTALL_K3S_WITH_NVIDIA_RUNTIME=true
    curl -sfL https://suanpan-public.oss-cn-shanghai.aliyuncs.com/k3s/deploy.sh | sh -
}

wait_for_k3s() {
    while ! nc -z localhost 6443; do
        info "Waiting k3s launch on 8080..."
        sleep 1
    done
    info "k3s launched successfully!"
}

delploy_suanpan_rocket() {
    curl -sfL https://suanpan-public.oss-cn-shanghai.aliyuncs.com/suanpan-rocket/deploy.sh | sh -
}

{
    deploy_k3s
    wait_for_k3s
    delploy_suanpan_rocket
}
