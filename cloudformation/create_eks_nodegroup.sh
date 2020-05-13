#!/usr/bin/env bash
# Creates EC2 worker nodes using imported vpc, subnets and security groups

# Loads configurations
. ./put_nodegroup_configs.sh

aws cloudformation create-stack --stack-name "eks-nodegroup" --template-body file://eks_nodegroup.yaml --parameters file://eks_nodegroup_params.json --capabilities CAPABILITY_IAM
