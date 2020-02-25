#!/bin/bash

set -e

VERSION=$(cat version.txt)

ossutil cp deployments/ "oss://suanpan-public/jetson/${VERSION}/init/" -rf
ossutil cp tools/init.sh "oss://suanpan-public/jetson/init.sh" -f
ossutil cp version.txt "oss://suanpan-public/jetson/version.txt" -f
