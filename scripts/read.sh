#!/usr/bin/env bash

set -ex

function machines_checkup() {
  docker-machine ls
}

function main() {
  machines_checkup
}

main
