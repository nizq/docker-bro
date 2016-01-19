#!/bin/bash

echo "===> Building build image..."
docker build -t nizq/bro-build .

echo "===> Building bro..."
docker run --rm -ti \
       -v `pwd`:/source \
       nizq/bro-build

echo "===> Building bro image..."
cp -v -f Dockerfile.final final/Dockerfile
cp -v -f bro-musl.patch final
cp -v -f binpac-musl.patch final
cp -v -f FindFTS.cmake final
cd final
docker build -t nizq/bro:fanout .
