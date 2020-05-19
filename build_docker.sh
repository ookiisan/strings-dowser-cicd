#!/usr/bin/env bash

## Build Docker strings-dowser image

# Step 1:
# Build image and add a descriptive tag
docker build --tag=strings-dowser:0.0.3 .
