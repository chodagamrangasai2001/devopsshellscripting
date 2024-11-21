#!/bin/bash
REGION=$1
set -x -e
echo "Lets get vpc information for the region $REGION ......."
aws ec2 describe-vpcs --region $REGION | jq ".Vpcs[].VpcId" -r
VPC_COUNT=$(aws ec2 describe-vpcs --region $REGION | jq ".Vpcs[].VpcId" -r | wc -l)
echo "$REGION has a total vpc count of ${VPC_COUNT} Vpcs"
