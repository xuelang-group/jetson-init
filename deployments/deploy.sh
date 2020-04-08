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

add_docker_daemon_json(){
    DOCKER_DAEMON_URL="https://suanpan-public.oss-cn-shanghai.aliyuncs.com/jetson/${VERSION}/deployments/docker/daemon.json"
    DOCKER_DAEMON_PATH="/etc/docker/daemon.json"
    url -sfL ${DOCKER_DAEMON_URL}  > ${DOCKER_DAEMON_PATH}
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
    INNER_CONFIGS_PATH="/etc/suanpan-rocket/inner.conf.d"
    EXTRA_CONFIGS_PATH="/etc/suanpan-rocket/extra.conf.d"
    mkdir -p ${INNER_CONFIGS_PATH} ${EXTRA_CONFIGS_PATH}

    ROCKET_CONFIGS_URL="https://suanpan-public.oss-cn-shanghai.aliyuncs.com/jetson/${VERSION}/deployments/suanpan-rocket/rocket.yaml"
    ROCKET_CONFIGS_PATH="${INNER_CONFIGS_PATH}/rocket.yaml"
    SERIAL_NUMBER=$(cat /proc/device-tree/serial-number)
    curl -sfL ${ROCKET_CONFIGS_URL} | sed "s/{{ SERIAL_NUMBER }}/${SERIAL_NUMBER}/g" > ${ROCKET_CONFIGS_PATH}
}

delploy_suanpan_rocket() {
    curl -sfL https://suanpan-public.oss-cn-shanghai.aliyuncs.com/suanpan-rocket/deploy.sh | sh -
}

{
    setup_verify_version
    install_nvidia_container_runtime
    add_docker_daemon_json
    deploy_k3s
    wait_for_k3s
    generate_suanpan_rocket_configs
    delploy_suanpan_rocket
}
