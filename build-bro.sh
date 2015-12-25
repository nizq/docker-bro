#!/bin/sh

SOURCE=/source
BUILD_DIR=$SOURCE/build
PREFIX=/usr/local

BRO_DIR=$BUILD_DIR/bro
AF_PACKET_DIR=$BRO_DIR/aux/plugins/af_packet

FINAL_DIR=$SOURCE/final

echo "===> Cloning bro..."
cd $BUILD_DIR
if [ ! -d "bro" ]; then
    git clone --recursive https://github.com/nizq/bro.git
fi

echo "===> Compiling bro..."
cd $BRO_DIR
CC=clang ./configure --disable-broker \
  --disable-broctl --disable-broccoli \
  --disable-auxtools --prefix=$PREFIX
make
make install

echo "===> Compiling af_packet plugin..."
cd $AF_PACKET_DIR
make distclean
CC=clang ./configure --with-kernel=/usr
make
make install

echo "===> Packaging..."
tar zcvf $FINAL_DIR/bro.tar.gz $PREFIX

