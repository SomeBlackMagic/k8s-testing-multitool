function docker_build () {
  echo CMD: docker build -t $1 .
  pushd $2 && docker build -t $1 . && popd
}

function build_image() {
    echo "$(tput bold)$(tput setb 4)$(tput setaf 3)$1$(tput sgr0)"
    IMAGE=$2
    DOCKER_PATH=$3
    docker_build ${IMAGE} ${DOCKER_PATH}
}

build_image "BUILD docker image" \
    "$DOCKER_SERVER_HOST/$DOCKER_PROJECT_PATH:$DOCKER_IMAGE_VERSION" \
    Dockerfile