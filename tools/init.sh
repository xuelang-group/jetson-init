#!/bin/bash

set -e

info() {
    echo '[INFO] ' "$@"
}

setup_verify_version() {
    if [ -z "${JETSON_INIT_VERSION}" ]; then
        export JETSON_INIT_VERSION=$(curl -sfL "https://suanpan-public.oss-cn-shanghai.aliyuncs.com/jetson/version.txt")
    fi
    info "Version: ${JETSON_INIT_VERSION}"
}

prepare() {
    setup_verify_version
}

init() {
    # add new jobs here, notice running order
    curl -sfL https://suanpan-public.oss-cn-shanghai.aliyuncs.com/jetson/${JETSON_INIT_VERSION}/deployments/clean.sh | sh -
    curl -sfL https://suanpan-public.oss-cn-shanghai.aliyuncs.com/jetson/${JETSON_INIT_VERSION}/deployments/deploy.sh | sh -
}

# add more jobs like these
# new_job() {
#     curl -sfL https://suanpan-public.oss-cn-shanghai.aliyuncs.com/jetson/${JETSON_INIT_VERSION}/deployments/xxx.sh | sh -
# }

{
    info "Start Initing Jetson..."
    prepare
    init
#   new_job
}
