# Happstack-docker

Simple setup for runing a happstack application in docker with nginx and postgresql.

## Install

1. Install docker platform https://www.docker.com/products/overview
2. Run `./create_docker_machine.sh`
3. Run `./compose.sh`
4. Run `docker-machine ls` and copy ip of happstack-dev to your web browser.

## Development

Make changes in web and run `./rebuild_web.sh`
