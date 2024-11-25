#!/bin/bash
echo $@
echo $*
if [ $# -gt 0 ]; then
    echo "you have provided $# Arguments to this script."
    for REGION in $@; do
        echo "Lets get vpc information for $REGION ......."
        aws ec2 describe-vpcs --region $REGION | jq ".Vpcs[].VpcId" -r
        VPC_COUNT=$(aws ec2 describe-vpcs --region $REGION | jq ".Vpcs[].VpcId" -r | wc -l)
        echo "$REGION has a total vpc count of ${VPC_COUNT} Vpcs"
    done
else
    REGION = $(aws ec2 describe-regions | jq ".Vpcs[].VpcId" -r)
    echo "No Region arg provided"
    echo $REGION
fi
