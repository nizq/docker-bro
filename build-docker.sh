#!/bin/bash

docker build -t nizq/bro-build .
docker run --rm -ti \
       -v `pwd`:/source \
       nizq/bro-build

cp Dockerfile.final final/Dockerfile
cd final
docker build -t nizq/bro:fanout .
