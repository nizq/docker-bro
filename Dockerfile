FROM alpine:3.3

MAINTAINER nizq <ni.zhiqiang@gmail.com>

RUN echo "===> Adding compile runtime..." && \
    apk add --update git perl cmake \
        make zlib-dev openssl-dev flex bison \
        python-dev libpcap-dev geoip-dev fts fts-dev \
        clang binutils g++ linux-headers

VOLUME ["/source"]
CMD ["/source/build-bro.sh"]
