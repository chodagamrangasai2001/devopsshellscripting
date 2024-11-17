#!/bin/bash
REGION=$1
echo "Lets get vpc information for the region $REGION ......."
aws ec2 describe-vpcs --region $REGION | jq ".Vpcs[].VpcId" -r
VPC_COUNT=$(aws ec2 describe-vpcs --region $REGION | jq ".Vpcs[].VpcId" -r | wc -l)
echo ${VPC_COUNT}
echo "${VPC_COUNT}"
echo "$REGION has a total vpc count of ${VPC_COUNT} Vpcs"
