#!/usr/bin/env bash
docker-machine create -d virtualbox happstack-dev
docker-machine ls
eval $(docker-machine env happstack-dev)