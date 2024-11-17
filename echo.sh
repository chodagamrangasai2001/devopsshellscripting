#!/bin/bash
echo "Lets get vpc information for the region us-east-1 ......."
aws ec2 describe-vpcs --region us-east-1 | jq ".Vpcs[].VpcId" -r
VPC_COUNT=$(aws ec2 describe-vpcs --region us-east-1 | jq ".Vpcs[].VpcId" -r | wc -l)
echo ${VPC_COUNT}
echo "${VPC_COUNT}"
echo "Us-east-1 has a total vpc count of ${VPC_COUNT} Vpcs"
