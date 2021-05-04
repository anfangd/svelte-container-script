#!/bin/bash

readonly ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && cd ../../ && pwd)"
DOCKER_DIR=${ROOT_DIR}/docker/containers

cd ${DOCKER_DIR}
docker-compose ps

