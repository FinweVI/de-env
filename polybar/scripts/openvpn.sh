#!/bin/bash

vpns=$(systemctl list-units | grep openvpn-client@)
vpns_count=$(echo "$vpns" | wc -l)
vpns_active=$(echo "$vpns" | grep active | wc -l)

if [ $vpns_active -ne 0 ]; then
    echo "  VPN On ($vpns_active/$vpns_count) "
else
    echo "  No VPN "
fi
