#!/usr/bin/env bash

set -ex

function machines_cleanup() {
  docker-machine rm primary -f -y

  for i in {1..2}
  do
    docker-machine rm db$i -f -y
  done

  for i in {1..2}
  do
    docker-machine rm web$i -f -y
  done
}

function main() {
  machines_cleanup
}

main
