#!/usr/bin/env bash
# Creates eks-vpc stack resources in aws-cli configured region

aws cloudformation create-stack --stack-name "eks-vpc" --template-body file://eks_vpc.yaml
