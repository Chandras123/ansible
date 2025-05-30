#!/bin/bash

# Script to create a list of EC2 instances using AWS CLI

# List of instance names to create



# Common variables
AMI_ID="ami-09c813fb71547fc4f"         # Replace with your AMI ID
INSTANCE_TYPE="t2.micro"                      # Replace with your key pair name
SECURITY_GROUP="sg-02e1cec7f1f2816eb"  # Replace with your security group ID
region="us-east-1"  # Replace with your desired region
aws configure set region $region
INSTANCES=("mongodb" "catalogue" "user" "cart" "shipping" "frontend" "payment" "rabbitmq")
# writing code for creating all instances present in the list
# Create instances using the AWS CLI
#looping through the instances and creating them
for instance in "${INSTANCES[@]}"; do
  echo "Creating instance: $instance"
  aws ec2 run-instances --image-id $AMI_ID --count 10 --instance-type $INSTANCE_TYPE --key-name roboshop --security-group-ids $SECURITY_GROUP --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$instance}]" --region $region
done