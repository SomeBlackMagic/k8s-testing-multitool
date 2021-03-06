#!/usr/bin/env bash
. .pipelines/vars_from_github_action.sh

function build_image() {
    echo "$(tput bold)$(tput setb 4)$(tput setaf 3)$1$(tput sgr0)"
    IMAGE=$2
    DOCKER_PATH=$3
    docker build -t ${IMAGE} ${DOCKER_PATH}
}

build_image "BUILD docker image" \
    "$DOCKER_SERVER_HOST/$DOCKER_PROJECT_PATH:$DOCKER_IMAGE_VERSION" \
    ./