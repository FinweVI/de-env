#!/bin/sh

if [ "$(pgrep openvpn)" ]; then
    echo "  VPN On "
else
    echo "  No VPN "
fi
