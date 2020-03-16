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
    # add new jobs here, notice running order
    export JETSON_INIT_VERSION=${VERSION}
    curl -sfL https://suanpan-public.oss-cn-shanghai.aliyuncs.com/jetson/${VERSION}/deployments/clean.sh | sh -
    curl -sfL https://suanpan-public.oss-cn-shanghai.aliyuncs.com/jetson/${VERSION}/deployments/deploy.sh | sh -
}

# add more jobs like these
# new_job() {
#     curl -sfL https://suanpan-public.oss-cn-shanghai.aliyuncs.com/jetson/${VERSION}/deployments/xxx.sh | sh -
# }

{
    info "Start Initing Jetson..."
    prepare
    init
#   new_job
}
