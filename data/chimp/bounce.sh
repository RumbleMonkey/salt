#!/usr/bin/env bash

set -ex

TAG=$1
ENV=$2
ENDPOINT=989485622078.dkr.ecr.us-west-2.amazonaws.com
CHIMP_REPO=rumblemonkey/chimp
ENVOY_REPO=rumblemonkey/chimp-envoy

# secret
set +x
$(aws ecr get-login --no-include-email --region us-west-2)
set -ex

export CHIMP_ENV=$ENV
export CHIMP_TAG=$TAG
export ENVOY_TAG=$TAG

docker pull $ENDPOINT/$CHIMP_REPO:$CHIMP_TAG
docker tag $ENDPOINT/$CHIMP_REPO:$CHIMP_TAG $CHIMP_REPO:$CHIMP_TAG

docker pull $ENDPOINT/$ENVOY_REPO:$ENVOY_TAG
docker tag $ENDPOINT/$ENVOY_REPO:$ENVOY_TAG $ENVOY_REPO:$ENVOY_TAG

#start envoy and chimp using docker compose
docker-compose up -d
