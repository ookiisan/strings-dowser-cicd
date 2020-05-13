#!/usr/bin/env bash
# Replaces <roleARN-to-replace> placeholder in configMap template file and applies ConfigMap

export INSTANCE_ROLE=$(aws cloudformation describe-stacks --stack-name "eks-nodegroup" --query "Stacks[0].Outputs[?OutputKey=='NodeInstanceRole'].OutputValue" --output text)
cp ../cloudformation/aws_cm_auth_tpl.yml ../cloudformation/configmap.yml

sed -i '' -e 's|<roleARN-to-replace>|'"${INSTANCE_ROLE}"'|g' ../cloudformation/configmap.yml

aws eks update-kubeconfig --name ekscluster

kubectl apply -f ../cloudformation/configmap.yml