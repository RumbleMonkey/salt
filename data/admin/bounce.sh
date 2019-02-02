#!/usr/bin/env bash

set -ex

TAG=$1
ENV=$2
ENDPOINT=989485622078.dkr.ecr.us-west-2.amazonaws.com
ADMIN_REPO=rumblemonkey/admin

# secret
set +x
$(aws ecr get-login --no-include-email --region us-west-2)
set -ex

export ADMIN_ENV=$ENV
export ADMIN_TAG=$TAG

docker pull $ENDPOINT/$ADMIN_REPO:$ADMIN_TAG
docker tag $ENDPOINT/$ADMIN_REPO:$ADMIN_TAG $ADMIN_REPO:$ADMIN_TAG

#start admin using docker compose
docker-compose up -d
