#!/usr/bin/env fish

git describe --tags > .version
docker run -it --rm -v .:/go/src golang:1.24-alpine3.22 ash src/build-in-docker.sh


