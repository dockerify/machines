#!/usr/bin/env bash

set -ex

function machines_config() {
  echo "ifconfig eth1 192.168.99.100 netmask 255.255.255.0 broadcast 192.168.99.255 up" \
    | docker-machine ssh primary sudo tee /var/lib/boot2docker/bootsync.sh > /dev/null
  docker-machine stop primary
  docker-machine start primary
  docker-machine regenerate-certs primary -f

  for i in {1..2}
  do
    echo "ifconfig eth1 192.168.99.20$i netmask 255.255.255.0 broadcast 192.168.99.255 up" \
      | docker-machine ssh db$i sudo tee /var/lib/boot2docker/bootsync.sh > /dev/null
    docker-machine stop db$i
    docker-machine start db$i
    docker-machine regenerate-certs db$i -f
  done

  for i in {1..2}
  do
    echo "ifconfig eth1 192.168.99.21$i netmask 255.255.255.0 broadcast 192.168.99.255 up" \
      | docker-machine ssh web$i sudo tee /var/lib/boot2docker/bootsync.sh > /dev/null
    docker-machine stop web$i
    docker-machine start web$i
    docker-machine regenerate-certs web$i -f
  done
}

function main() {
  machines_config
}

main
