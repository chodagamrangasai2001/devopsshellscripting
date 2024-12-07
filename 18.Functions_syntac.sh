#!/bin/bash
function demofunc1 {
    echo "Welcome to demo func 1"
}
demofunc2() {
    echo "Welcom to demo func 2"
}
demofunc1
demofunc2

Get_VPC() {
    echo "Running The Functon To List VPCs in $1"
    vpc_list=$(aws ec2 describe-vpcs --region $1 | jq .Vpcs[].VpcId | tr -d '"')
    for vpc in $(echo $vpc_list); do
        echo "The VPC ID IS:$vpc"
        echo "======================================="
    done
}
for X in $@; do
    Get_VPC $X
done
