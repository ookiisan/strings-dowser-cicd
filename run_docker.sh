#!/usr/bin/env bash

## Get Docker strings-dowser running locally

# Step 1:
# Build Docker image
sh ./build_docker.sh

# Step 2: 
# List docker images
docker image ls

# Step 3: 
# Run flask app
docker run --name strings-dowser -d -p 80:30001 strings-dowser:${APP_VERSION}
