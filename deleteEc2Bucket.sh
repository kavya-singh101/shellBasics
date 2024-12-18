#!/bin/bash

#set -x
set -e

# -n check that the string is non empty

if [ "$1" != "x" ]; then
  aws ec2 terminate-instances --instance-ids $1 >> ec2DeleteLogs.txt
fi

#if [[ "$2" != "x" ]]; then
if [[ -n "$2" && "$2" != "x" ]]; then
  aws s3api delete-bucket --bucket $2 --region us-east-1
fi

echo "end :)"
