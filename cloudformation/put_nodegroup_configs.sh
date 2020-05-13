#!/usr/bin/env bash
# Create a parameters for node group creation in Systems Manager Parameter Store

aws ssm put-parameter --name ClusterControlPlaneSecurityGroup --type String --value $(aws cloudformation describe-stacks --stack-name "eks-vpc" --query "Stacks[0].Outputs[?OutputKey=='SecurityGroups'].OutputValue" --output text) --overwrite
aws ssm put-parameter --name VpcId --type String --value $(aws cloudformation describe-stacks --stack-name "eks-vpc" --query "Stacks[0].Outputs[?OutputKey=='VpcId'].OutputValue" --output text) --overwrite
aws ssm put-parameter --name Subnets --type StringList --value $(aws cloudformation describe-stacks --stack-name "eks-vpc" --query "Stacks[0].Outputs[?OutputKey=='SubnetIds'].OutputValue" --output text) --overwrite