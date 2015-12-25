#!/bin/bash

docker run -it --rm --net=host \
       -v `pwd`/logs:/data/logs \
       -v `pwd`/config:/data/config \
       defstack/bro \
       bro -i eth0 /data/config/test-fanout.bro
