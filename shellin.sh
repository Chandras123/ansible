#!/bin/bash

# Script to create multiple cloud instances with different variables using AWS CLI

# Arrays of variables
AMI_IDS=("ami-09c813fb71547fc4f")   # Replace with your AMI IDs
INSTANCE_TYPES=("t2.micro")                    # Replace with your key pair names
SECURITY_GROUPS=("sgr-0361f980111982118")
INSTANCES=("mongodb" "redis" "mysql" "rabbitmq" "catalogue" "user" "cart" "shipping" "payment" "dispatch" "frontend") # Replace with your security group IDs
COUNTS=($i)                                         # Number of instances to launch for each set

# Loop through arrays
for i in "${INSTANCES[@]}"; do
  echo "Launching ${COUNTS[$i]} instance(s) with:"
  echo "  AMI ID: ${AMI_IDS[$i]}"
  echo "  Instance Type: ${INSTANCE_TYPES[$i]}"
  echo "  Security Group: ${SECURITY_GROUPS[$i]}"
  
  aws ec2 run-instances \
    --image-id "${AMI_IDS[$i]}" \
    --count "${COUNTS[$i]}" \
    --instance-type "${INSTANCE_TYPES[$i]}" \
    --security-group-ids "${SECURITY_GROUPS[$i]}"
done

echo "All instance(s) creation initiated."