#!/usr/bin/env bash

function main() {
  build

  if [[ "$1" == "watch" ]]; then
    watch_build
  fi
}

function watch_build() {
  msg="\033[1;37m> Prepared to rebuild on new changes...\033[0m"

  if command -v inotifywait >/dev/null; then
    echo -e $msg
    while inotifywait -q -r -e modify web/ ; do
      build
    done
  fi

  if command -v fswatch >/dev/null; then
    echo -e $msg
    fswatch ./web | (while read; do build; done)
  fi
}

function build() {
	eval $(docker-machine env happstack-dev)
	docker-compose -f docker-compose.yml stop
	docker-compose -f docker-compose.yml rm -f web nginx
	docker-compose -f docker-compose.yml build web nginx
	docker-compose -f docker-compose.yml up -d web nginx
	docker-compose -f docker-compose.yml start
	docker-compose ps
}

main "$@"
