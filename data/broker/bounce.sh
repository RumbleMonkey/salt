#!/usr/bin/env bash

set -ex

TAG=$1
ENV=$2
ENDPOINT=989485622078.dkr.ecr.us-west-2.amazonaws.com
BROKER_REPO=rumblemonkey/broker
ENVOY_REPO=rumblemonkey/broker-envoy

# secret
set +x
$(aws ecr get-login --no-include-email --region us-west-2)
set -ex

export BROKER_ENV=$ENV
export BROKER_TAG=$TAG
export ENVOY_TAG=$TAG

docker pull $ENDPOINT/$BROKER_REPO:$BROKER_TAG
docker tag $ENDPOINT/$BROKER_REPO:$BROKER_TAG $BROKER_REPO:$BROKER_TAG

docker pull $ENDPOINT/$ENVOY_REPO:$ENVOY_TAG
docker tag $ENDPOINT/$ENVOY_REPO:$ENVOY_TAG $ENVOY_REPO:$ENVOY_TAG

#start envoy and broker using docker compose
docker-compose up -d
