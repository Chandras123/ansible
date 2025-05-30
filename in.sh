#!/bin/bash

# Script to create a list of EC2 instances using AWS CLI

# List of instance names to create
INSTANCES=("mongodb" "redis" "mysql" "rabbitmq" "catalogue" "user" "cart" "shipping" "payment" "dispatch" "frontend")


# Common variables
AMI_ID="ami-09c813fb71547fc4f"         # Replace with your AMI ID
INSTANCE_TYPE="t2.micro"                      # Replace with your key pair name
SECURITY_GROUP="sgr-0361f980111982118"   # Replace with your security group ID

for NAME in "${INSTANCES[@]}"; do
  echo "Launching instance: $NAME"
  aws ec2 run-instances \
    --image-id $AMI_ID \
    --count 1 \
    --instance-type $INSTANCE_TYPE \
    --security-group-ids $SECURITY_GROUP \
    --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$NAME}]"
done

echo "All instances creation initiated."