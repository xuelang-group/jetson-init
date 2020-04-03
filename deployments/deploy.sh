#!/bin/bash

set -e

info() {
    echo '[INFO] ' "$@"
}

setup_verify_version() {
    VERSION="${JETSON_INIT_VERSION}"
}

install_nvidia_container_runtime(){
    apt-get update
    apt-get install -y nvidia-container-runtime
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

generate_suanpan_rocket_configs() {
    ROCKET_CONFIG_URL="https://suanpan-public.oss-cn-shanghai.aliyuncs.com/jetson/${VERSION}/deployments/suanpan-rocket/rocket.yaml"
    ROCKET_CONFIG_PATH="/etc/suanpan-rocket/inner.conf.d/rocket.yaml"
    SERIAL_NUMBER=$(cat /proc/device-tree/serial-number)
    mkdir -p $(dirname ${ROCKET_CONFIG_PATH})
    curl -sfL ${ROCKET_CONFIG_URL} | sed "s/{{ SERIAL_NUMBER }}/${SERIAL_NUMBER}/g" > ${ROCKET_CONFIG_PATH}
}

delploy_suanpan_rocket() {
    curl -sfL https://suanpan-public.oss-cn-shanghai.aliyuncs.com/suanpan-rocket/deploy.sh | sh -
}

{
    setup_verify_version
    install_nvidia_container_runtime
    deploy_k3s
    wait_for_k3s
    generate_suanpan_rocket_configs
    delploy_suanpan_rocket
}
