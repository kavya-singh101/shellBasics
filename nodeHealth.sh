#!/bin/bash

########################################
# Author: Kavya
# date: 16/12/2024
#
# Used to see the health of a node like processes, disk, memory
#
# version: v1
########################################

set -x #debug mode
set -e #exit when there is an error
set -o #pipefail

#jkcdjs #to test set -e

echo "############################ memory usage:- ####################################"

free -g

echo "#################################### disk usage:- ####################################"

df -h

echo "#################################### number of processes usage  ####################################"

nproc

echo "#################################### processes with their pid ####################################"

ps -ef

echo "#################################### additional details ####################################"

neofetch

echo "#################################### pid of processes using python ####################################"

ps -ef | grep python | awk -F" " '{print $2}'

echo "#################################### summary  ####################################"

top
