#!/usr/bin/env bash
# Creates EKS cluster using imported role, subnets and security groups

# Loads configurations
. ./config.sh

aws eks create-cluster --name ekscluster --kubernetes-version 1.16 --role-arn "${SERVICE_ROLE}" --resources-vpc-config subnetIds="${SUBNET_IDS}",securityGroupIds="${SECURITY_GROUP}"
