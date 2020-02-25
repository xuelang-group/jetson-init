#!/bin/bash

set -e

info() {
    echo '[INFO] ' "$@"
}

setup_verify_version() {
    if [ -n "${JETSON_INIT_VERSION}" ]; then
        VERSION="${JETSON_INIT_VERSION}"
    else
        VERSION=$(curl -sfL "https://suanpan-public.oss-cn-shanghai.aliyuncs.com/jetson/version.txt")
    fi
    info "Version: ${VERSION}"
}

prepare() {
    setup_verify_version
}

init() {
    curl -sfL https://suanpan-public.oss-cn-shanghai.aliyuncs.com/jetson/${VERSION}/deployments/deploy.sh | sh -
}

{
    info "Start Initing Jetson..."
    prepare
    init
}
