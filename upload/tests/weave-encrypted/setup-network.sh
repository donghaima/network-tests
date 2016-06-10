#!/bin/bash

set -e

# set up network with private IPs for host 
# for net=bridge, simply put both addresses on lo
# because of port mapping, it will work just fine


COMMON=$(dirname "${BASH_SOURCE[0]}")/../../common
. $COMMON/getoption

IPRANGE=192.168.0.0/16

# open the firewall ports necessary
#   TCP 6783 and UDP 6783/6784
firewall-cmd --zone=trusted --add-source=$IPRANGE

# need to account for our remote peers
WEAVE_NO_FASTDP=true weave launch --password abcd1234 --ipalloc-range $IPRANGE $PEER

