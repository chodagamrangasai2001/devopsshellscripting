#!/bin/bash
rm -rf /tmp/EVEN.log && rm -rf /tmp/ODD.log
for I in {2..100}; do
    if [ $(expr $I % 2) == 0 ]; then
        echo "$I is the even number" >>/tmp/EVEN.log
    else
        echo "$I is odd number" >>/tmp/ODD.log
    fi
done
