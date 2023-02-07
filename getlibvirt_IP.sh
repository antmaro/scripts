#!/bin/bash
# Adding this to the master branch and cherry-pick to release
#
# Script that returns the IP Address of a libvirt domain

OPTS=$@
domain=$1

show_help() {
        echo "Usage: $0 domain_name"
        echo 
}


##########
# main
#########

if [ ! ${OPTS} ]; then
        show_help
        exit 0
fi

# Obtain the IP from a domain
sudo virsh domifaddr ${domain} | grep ipv4 | awk '{print $4}' | cut -d"/" -f1
