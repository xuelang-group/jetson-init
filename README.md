# jetson-init
Jetson Init Scripts as a single k3s server

`version: 0.0.22`

## Usage

``` bash
curl -sfL https://suanpan-public.oss-cn-shanghai.aliyuncs.com/jetson/init.sh | sh -
```

## install cuda
``` bash
curl -sfL https://suanpan-public.oss-cn-shanghai.aliyuncs.com/jetson/0.0.22/deployments/install_cuda.sh | sh -
```

## mv docker to /mnt/ssd [only test]
build ssd ext mnt (/mnt/ssd) with 
``` bash
curl -sfL https://suanpan-public.oss-cn-shanghai.aliyuncs.com/jetson/0.0.22/deployments/build_mnt.sh | sh -
```
[or do it yourself]

mv docker to /mnt/ssd
``` bash
curl -sfL https://suanpan-public.oss-cn-shanghai.aliyuncs.com/jetson/0.0.22/deployments/mv_docker_mnt.sh | sh -
```

## develop
1. switch branch "develop"
2. add/edit script-wheels in deployments directory
3. add running job in tools/init.sh (see comments )
4. do your git commit and `bash tools/upgrade.sh`


## run when no internet
refer deployments/nmcli_wifi.sh or deployments/no_nmcli_wifi.sh

warning: su root before connect wifi, or wifi wont up before login
