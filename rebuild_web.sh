#!/usr/bin/env bash
eval $(docker-machine env happstack-dev)
docker-compose -f docker-compose.yml stop
docker-compose -f docker-compose.yml rm -f web nginx
docker-compose -f docker-compose.yml build web nginx
docker-compose -f docker-compose.yml up -d web nginx
docker-compose -f docker-compose.yml start
docker-compose ps
