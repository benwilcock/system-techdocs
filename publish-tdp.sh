#!/bin/bash

# npx @techdocs/cli publish \
# --publisher-type awsS3 \
# --storage-name tap-techdocs \
# --entity where-for-dinner/component/where-for-dinner
# Build the docker image
docker build . -t techdocs

# Run the docer image to generate the site and upload it
docker run --rm --env-file tdp.env -v ./:/tmp/catalog/ techdocs /tmp/catalog/tdp-catalog-info.yaml awsS3 wilcockb-techdocs