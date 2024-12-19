#!/bin/bash

###################################
# Author: Kavya Singh
# Date: 17/12/2024
#
# **This script will terminate all running EC2 instances with user confirmation.
# Version: V2
###################################

#set -x
set -e

# Get the instance IDs of all running instances
INSTANCE_IDS=$(aws ec2 describe-instances \
  --query "Reservations[].Instances[?State.Name=='running'].InstanceId" \
  --output text)

# Check if there are any running instances
if [[ -z "$INSTANCE_IDS" ]]; then
  echo "No running instances found."
  exit 0
fi

# Display the list of instance IDs to terminate
echo "The following running instances will be terminated:"
echo "$INSTANCE_IDS"

# Ask for user confirmation before proceeding
read -p "Are you sure you want to terminate these instances? (y/n): " CONFIRMATION

if [[ "$CONFIRMATION" != "y" ]]; then
  echo "Termination cancelled."
  exit 0
fi

# Terminate all running instances
echo "Terminating instances..."
aws ec2 terminate-instances --instance-ids $INSTANCE_IDS

# Wait for the instances to be terminated
echo "Waiting for instances to be terminated..."
aws ec2 wait instance-terminated --instance-ids $INSTANCE_IDS

echo "All running instances have been terminated."
