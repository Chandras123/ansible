#!/bin/bash
#writng a script to create a list of EC2 instances using AWS CLI
# List of instance names to create
# Common variables
AMI_ID="ami-09c813fb71547fc4f"         # Replace with your AMI ID
INSTANCE_TYPE="t2.micro"                      # Replace with your key pair name
SECURITY_GROUP="sg-02e1cec7f1f2816eb"  # Replace with your security group ID
region="us-east-1"  # Replace with your desired region
aws configure set region $region

INSTANCE_NAMES=( "cart" "catalogue" "user" "cart" "shipping" "frontend" "payment" "rabbitmq") # Accepting instance names as command line arguments

for NAME in "${INSTANCE_NAMES[@]}"; do
  echo "Launching instance: $NAME"
  aws ec2 run-instances \
    --image-id $AMI_ID \
    --count 1 \
    --instance-type $INSTANCE_TYPE \
    --security-group-ids $SECURITY_GROUP \
    --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$NAME}]"
done

