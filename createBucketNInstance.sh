#!/bin/bash

###################################
# Author: Kavya Singh
# Date: 17/12/2024
#
# **This script will create the instance & S3 Bucket and store all the description in a text file
# Version: V1
###################################

#set -x
set -e

if [[ "$1" != "x" ]]; then
echo "Creating an s3 bucket"
aws s3api create-bucket --bucket $1 --region us-east-1 >> createdBucketDetail.txt
fi

INSTANCE_COUNT=1

if [[ -n "$3" ]]; then
    if ! [[ "$3" =~ ^[1-9][0-9]*$ ]]; then
        echo "Error: The third argument must be a positive integer."
        exit 1
    fi
    INSTANCE_COUNT=$3
fi

#if [[ "$2" != "x" ]]; then
if [[ -n "$2" && "$2" != "x" ]]; then
echo "creating an Instance"
#aws ec2 run-instances \
#  --image-id ami-0c2b8ca1dad447f8a \   # Ubuntu 20.04 LTS AMI for us-east-1
#  --count $3 \
#  --instance-type t2.micro \           # Default instance type (you can choose a different one if needed)
#  --key-name test.pem \                # The public key to associate with the instance
#  --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=$2}]' \
#  --region us-east-1 >>

aws ec2 run-instances --image-id ami-0c2b8ca1dad447f8a --count $INSTANCE_COUNT --instance-type t2.micro --key-name test --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$2}]" >> createdInstanceDetail.txt
fi
#####################################################################################
echo "Stroring logs"

echo "Description of Instances"
aws ec2 describe-instances >> InstancesDeatil.txt

echo "List of S3 buckets"
aws s3 ls >> s3list.txt

echo "Instance's IDs"
aws ec2 describe-instances | jq '.Reservations[].Instances[].InstanceId'
