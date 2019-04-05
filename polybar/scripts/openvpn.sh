#!/bin/bash

if [ "$(pgrep -x openvpn)" ]; then
    echo "  VPN On "
else
    echo "  No VPN "
fi
