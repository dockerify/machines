#!/usr/bin/env bash

set -ex

function machines_setup() {
  docker-machine create primary \
    --virtualbox-disk-size "2000" \
    --driver virtualbox || true

  for i in {1..2}
  do
    docker-machine create db$i \
      --virtualbox-disk-size "2000" \
      --driver virtualbox || true
  done

  for i in {1..2}
  do
    docker-machine create web$i \
      --virtualbox-disk-size "2000" \
      --driver virtualbox || true
  done
}

function main() {
  machines_setup
}

main
