#!/bin/bash

set -x
set -e


aws ec2 terminate-instances --instance-ids $1 >> ec2DeleteLogs.txt
aws s3api delete-bucket --bucket $2 --region us-east-1


