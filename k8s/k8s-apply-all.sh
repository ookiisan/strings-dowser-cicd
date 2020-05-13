#!/usr/bin/env bash
# Applies deployment and load balancer service to k8s cluster

kubectl apply -f strings-dowser-deployment.yaml
kubectl apply -f strings-dowser-service.yaml