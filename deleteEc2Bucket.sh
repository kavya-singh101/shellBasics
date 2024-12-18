#!/bin/bash

set -x
set -e

# -n check that the string is non empty

if [ -n "$1" ]; then
  aws ec2 terminate-instances --instance-ids $1 >> ec2DeleteLogs.txt
fi

if [ -n "$2" ]; then
  aws s3api delete-bucket --bucket $2 --region us-east-1
fi

echo "end :)"
