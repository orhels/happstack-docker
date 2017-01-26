#!/usr/bin/env bash
eval $(docker-machine env happstack-dev)
docker-compose -f docker-compose.yml up -d
docker-compose ps