#!/usr/bin/env bash

set -ex

TAG=$1
ENV=$2
ENDPOINT=989485622078.dkr.ecr.us-west-2.amazonaws.com
PRIMATE_REPO=rumblemonkey/primate
ENVOY_REPO=rumblemonkey/primate-envoy

# secret
set +x
$(aws ecr get-login --no-include-email --region us-west-2)
set -ex

export PRIMATE_ENV=$ENV
export PRIMATE_TAG=$TAG
export ENVOY_TAG=$TAG

docker pull $ENDPOINT/$PRIMATE_REPO:$PRIMATE_TAG
docker tag $ENDPOINT/$PRIMATE_REPO:$PRIMATE_TAG $PRIMATE_REPO:$PRIMATE_TAG

docker pull $ENDPOINT/$ENVOY_REPO:$ENVOY_TAG
docker tag $ENDPOINT/$ENVOY_REPO:$ENVOY_TAG $ENVOY_REPO:$ENVOY_TAG

#start redis, envoy and primate using docker compose
docker-compose up -d
