#!/bin/bash
systemctl status nginx
if [ $? -eq 0 ]; then
    echo "nginx already running lets validate curl"
    curl -sL http://localhost
else
    echo "nginx is not running lets start it"
    curl -sL http://localhost
fi
