#!/bin/bash
#===============================================================================
#
#          FILE:  iptables-rules.sh
# 
#         USAGE:  ./iptables-rules.sh 
# 
#   DESCRIPTION:  Iptables rules for running Tor router on localhost
# 
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:   (brandon.grantham), 
#       COMPANY:  
#       VERSION:  1.0
#       CREATED:  05/22/2016 06:03:18 PDT
#      REVISION:  0.1
#===============================================================================

#!/bin/bash

# credit goes to J Frazz and the Tor project

# run ip tables commands as root or die
if ["$EUID" -ne 0 ]; then
     echo "Please login as root"
     return 1
fi

#### set vars 
# destinations you don't want to be routed through
# more specifically, local network. Adjust as needed for your network
# i.e. ifconfig is your friend
_non_tor="10.0.0.0/24"

# get the UID that Tor is running on
_tor_uid=$(docker exec -u tor tor id -u)

# Tor's TransPort (not clear what this is to me.. TODO I guess)
_trans_port="9040"
_dns_port-"5353"

### set iptables nat address
iptables -t nat -A OUTPUT -m owner --uid-owner $_tor_uid -j RETURN
iptables -t nat -A OUTPUT -p udp --dport 53 -j REDIRECT --to-ports $_dns_port

# allow clearnet (aka unencrypted) access for hosts in the $_non_tor identified ip range
for _clearnet in $_non_tor 127.0.0.0/9 127.128.0.0/10; do
   iptables -t nat -A OUTPUT -d $_clearnet -j RETURN
done

# redirect all other output to Tor's TransPort
iptables -t nat -A OUTPUT -p tcp --syn -j REDIRECT --to-ports $_trans_port

### set iptables *filter
iptables -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

# allow clearnet access for hosts in $_non_tor
for _clearnet in $_non_tor 127.0.0.0/8; do
   iptables -A OUTPUT -d $_clearnet -j ACCEPT
done

# allow only Tor output
iptables -A OUTPUT -m owner --uid-owner $_tor_uid -j ACCEPT
iptables -A OUTPUT -j REJECT

