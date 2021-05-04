#!/bin/bash

readonly ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && cd ../../ && pwd)"
DOCKER_DIR=${ROOT_DIR}/docker/containers

cd ${ROOT_DIR}
mv ${ROOT_DIR}/README.md.org ${ROOT_DIR}/README.md
ls -a | grep -v -E "^\.$|^\.\.$|^docker|^README.md|^.gitignore|^Makefile|^svelte" | xargs rm -rf
