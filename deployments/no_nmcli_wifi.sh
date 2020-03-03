#!/bin/bash
set -e
# WIFI_SSID=TP-LINK_xxx WIFI_PASSWD=12345678  bash deployments/no_nmcli_wifi.sh
echo setting wifi with wpa_passphrase
echo SSID=${WIFI_SSID}
echo PASSWORD=${WIFI_PASSWD}
wpa_passphrase $WIFI_SSID $WIFI_PASSWD > /tmp/wifi.conf
wpa_supplicant -B -i wlan0 -Dwext -c  /tmp/wifi.conf
# enable dhcp
dhclient wlan0