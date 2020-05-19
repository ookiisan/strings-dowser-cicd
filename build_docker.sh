#!/usr/bin/env bash

## Builds Docker strings-dowser image
export APP_VERSION=$(<./strings-dowser/version.txt)

# Build image and add a descriptive tag
cd ./strings-dowser
docker build --tag=strings-dowser:${APP_VERSION} .
