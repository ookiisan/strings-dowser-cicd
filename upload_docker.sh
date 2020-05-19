#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# Assumes that an image is built via `build_docker.sh`

# Step 1:
# Create dockerpath
export imagename=strings-dowser
export dockerpath=ookiisan/$imagename
export version=0.0.2

# Step 2:  
# Authenticate & tag
docker login
docker tag $imagename:$version $dockerpath:$version

# Step 3:
# Push image to a docker repository
docker push $dockerpath:$version
