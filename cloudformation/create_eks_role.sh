#!/usr/bin/env bash
# Creates eks-role stack resources

aws cloudformation create-stack --stack-name "eks-role" --template-body file://eks_role.yaml --capabilities CAPABILITY_IAM
