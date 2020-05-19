#!/usr/bin/env bash

## Builds Docker strings-dowser image
export APP_VERSION=$(<./strings-dowser/version.txt)

# Step 1:
# Build image and add a descriptive tag
docker build --tag=strings-dowser:$APP_VERSION .
