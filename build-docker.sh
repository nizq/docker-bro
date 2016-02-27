#!/bin/bash

echo "===> Building build image..."
docker build -t nizq/bro-build .

echo "===> Building bro..."
docker run --rm -ti \
       -v `pwd`:/source \
       nizq/bro-build

echo "===> Building bro image..."
cp -v -f Dockerfile.final final/Dockerfile
cd final
docker build -t nizq/bro:fanout .
