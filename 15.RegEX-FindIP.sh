#!/bin/bash
DATA=$(cat iplist.log)
for IPADDRESS in $DATA; do
    if [[ $IPADDRESS =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
        echo "$IPADDRESS is Valid."
    else
        echo "$IPADDRESS is NOT Valid."
    fi
done
