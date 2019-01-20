#!/usr/bin/env bash

set -ex

TAG=$1
ENV=$2
ENDPOINT=989485622078.dkr.ecr.us-west-2.amazonaws.com
REPO=rumblemonkey/alpha
CONTAINER=alpha

# secret
set +x
$(aws ecr get-login --no-include-email --region us-west-2)
set -ex

docker pull $ENDPOINT/$REPO:$TAG
docker tag $ENDPOINT/$REPO:$TAG $REPO:$TAG

# || true so we don't fail if its already not running
docker stop $CONTAINER || true

docker run -d\
    --rm\
    -e "NODE_ENV=$ENV"\
    -v${HOME}/troop/config:/home/troop/.config/RumbleMonkey\
    --name $CONTAINER\
    -p7625:7625\
    -p80:7265\
    $REPO:$TAG
