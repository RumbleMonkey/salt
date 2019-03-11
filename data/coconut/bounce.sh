#!/usr/bin/env bash

set -ex

TAG=$1
ENV=$2
ENDPOINT=989485622078.dkr.ecr.us-west-2.amazonaws.com
COCONUT_REPO=rumblemonkey/coconut
ENVOY_REPO=rumblemonkey/coconut-envoy

# secret
set +x
$(aws ecr get-login --no-include-email --region us-west-2)
set -ex

export COCONUT_ENV=$ENV
export COCONUT_TAG=$TAG
export ENVOY_TAG=$TAG

docker pull $ENDPOINT/$COCONUT_REPO:$COCONUT_TAG
docker tag $ENDPOINT/$COCONUT_REPO:$COCONUT_TAG $COCONUT_REPO:$COCONUT_TAG

docker pull $ENDPOINT/$ENVOY_REPO:$ENVOY_TAG
docker tag $ENDPOINT/$ENVOY_REPO:$ENVOY_TAG $ENVOY_REPO:$ENVOY_TAG

#start envoy and coconut using docker compose
docker-compose up -d
