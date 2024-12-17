#!/bin/bash

###################################
# Author: Kavya Singh
# Date: 17/12/2024
#
# **This script will create the instance & S3 Bucket and store all the description in a text file
# Version: V1
###################################

set -x
set -e

echo "Creating an s3 bucket"
aws s3api create-bucket --bucket $1 --region us-east-1 >> createdBucketDetail.txt

echo "creating an Instance"
aws ec2 run-instances --image-id ami-0b0ea68c435eb488d --count 1 --instance-type t2.micro --key-name test --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$2}]" >> createdInstanceDetail.txt

#####################################################################################
echo "Stroring logs"

echo "Description of Instances"
aws ec2 describe-instances >> InstancesDeatil.txt

echo "List of S3 buckets"
aws s3 ls >> s3list.txt

