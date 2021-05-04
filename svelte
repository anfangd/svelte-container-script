#!/bin/bash

clear

echo "------------------------"
echo "START"
echo "------------------------"
set -xeuC

# グローバル定数
readonly ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
readonly DOCKER_CONTAINER_DIR=$ROOT_DIR/docker/containers
readonly DOCKER_SCRIPT_DIR=$ROOT_DIR/docker/scripts

function usage() {
  cat <<EOS >&2
Usage: $0 [COMMAND]

Commands:
  docker:down           
  docker:ps             
  docker:up             
  app:svelte:init       
  app:svelte:start      
  app:sapper:init       
  app:sapper:start      
  repo:reset            
EOS
  exit 1
}

function ps_container() {
  echo "ps container"
  sh "$DOCKER_SCRIPT_DIR/ps-containers.sh"
}

function up_container() {
  echo "up container"
  sh "$DOCKER_SCRIPT_DIR/up-containers.sh"
}

function down_container() {
  echo "down container"
  sh "$DOCKER_SCRIPT_DIR/down-containers.sh"
}

function reset_repository() {
  echo "reset repository"
  sh "$DOCKER_SCRIPT_DIR/reset-repository.sh"
}

function init_svelte() {
  echo "initialize svelte"
  sh "$DOCKER_SCRIPT_DIR/initialize-svelte.sh"
}

function start_svelte() {
  echo "start svelte"
  sh "$DOCKER_SCRIPT_DIR/start-svelte.sh"
}

function init_sapper() {
  echo "initialize sapper"
  sh "$DOCKER_SCRIPT_DIR/initialize-sapper.sh"
}

function start_sapper() {
  echo "start sapper"
  sh "$DOCKER_SCRIPT_DIR/start-sapper.sh"
}

function main() {
  echo "main function"

  case "$1" in
  "docker:ps"   ) ps_container ;;
  "docker:up"   ) up_container ;;
  "docker:down" ) down_container ;;
  "repo:reset"  ) reset_repository ;;
  "app:svelte:init"    ) init_svelte ;;
  "app:svelte:start"   ) start_svelte ;;
  "app:sapper:init"    ) init_sapper ;;
  "app:sapper:start"   ) start_sapper ;;
  *             ) usage ;;
  esac

}

echo "BASH_SOURCE is" $BASH_SOURCE
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  main $1
fi
