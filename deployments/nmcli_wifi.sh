#!/bin/bash
set -e
# WIFI_SSID=TP-LINK_xxx WIFI_PASSWD=12345678  bash deployments/nmcli_wifi.sh
echo setting wifi
echo SSID=${WIFI_SSID}
echo PASSWORD=${WIFI_PASSWD}
# nmcli dev wifi connect "wifi名" password "密码"
nmcli dev wifi connect ${WIFI_SSID} password ${WIFI_PASSWD}
