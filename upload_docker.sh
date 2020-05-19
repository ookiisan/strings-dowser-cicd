#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# Assumes that an image is built via `build_docker.sh`

# Step 1:
# Creates dockerpath
export IMAGE_NAME=strings-dowser
export DOCKER_PATH=ookiisan/${IMAGE_NAME}
export APP_VERSION=$(<./strings-dowser/version.txt)

# Step 2:  
# Authenticates & tags
docker login
docker tag ${IMAGE_NAME}:${APP_VERSION} ${DOCKER_PATH}:${APP_VERSION}

# Step 3:
# Pushes image to a docker repository
docker push ${DOCKER_PATH}:${APP_VERSION}
