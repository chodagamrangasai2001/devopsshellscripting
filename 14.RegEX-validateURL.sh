#!/bin/bash
DATA=$(cat applist.org)
echo $DATA
for URL in $DATA 
do
    if [[ "$URL" =~ ^https://([^/]+) ]]; then
    domain=${BASH_REMATCH[1]}
    echo "$URL is a valid and domain name is $domain"
else
    echo "$URL is invalid and domain name is not available"
fi
done
