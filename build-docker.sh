#!/bin/bash

docker build -t nizq/bro-build .
docker run --rm -ti \
       -v `pwd`:/source \
       -v /var/run/docker.sock:/var/run/docker.sock \
       nizq/bro-build

cp Dockerfile.final final/Dockerfile
cd final
docker build -t nizq/bro-fanout .
