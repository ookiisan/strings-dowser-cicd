export SERVICE_ROLE=$(aws cloudformation describe-stacks --stack-name eks-role --query "Stacks[0].Outputs[0].OutputValue" --output text)

export SECURITY_GROUP=$(aws cloudformation describe-stacks --stack-name "eks-vpc" --query "Stacks[0].Outputs[?OutputKey=='SecurityGroups'].OutputValue" --output text)

export SUBNET_IDS=$(aws cloudformation describe-stacks --stack-name "eks-vpc" --query "Stacks[0].Outputs[?OutputKey=='SubnetIds'].OutputValue" --output text)

