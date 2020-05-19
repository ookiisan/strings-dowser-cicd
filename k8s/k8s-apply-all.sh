#!/usr/bin/env bash
# Applies deployment and load balancer service to k8s cluster

export APP_VERSION=$(<../strings-dowser/version.txt)

cp ./strings-dowser-deployment_tpl.yaml ./strings-dowser-deployment.yaml

sed -i '' -e 's|<app-version-to-replace>|'"${APP_VERSION}"'|g' ./strings-dowser-deployment.yaml

kubectl apply -f strings-dowser-deployment.yaml

kubectl apply -f strings-dowser-service.yaml