#!/bin/bash

readonly ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && cd ../../ && pwd)"
DOCKER_DIR=${ROOT_DIR}/docker/containers

mv ${ROOT_DIR}/README.md ${ROOT_DIR}/README.md.org

cd ${DOCKER_DIR}
docker-compose exec svelte sh -c "npx degit sveltejs/sapper-template#webpack sapper-app && mv sapper-app/* ./ && rm -rf sapper-app && npm i"
