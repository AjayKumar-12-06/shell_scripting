#!/bin/bash

source_dir="/home/ec2-user"

find_old_log=$( find $source_dir -name "*.log" -mtime 14)

echo "The old logs are:" $find_old_log