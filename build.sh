#!/bin/bash

SCRIPTDIR=$(dirname "$0")

ALICE_VISION_INSTALL_DIR=$(realpath "$SCRIPTDIR/../AliceVision/install")
ALICE_VISION_CMAKE_DIR=$(realpath "$ALICE_VISION_INSTALL_DIR/share/aliceVision/cmake")
QT_DIR=$HOME/Qt/6.8.3/gcc_64

mkdir -p "$SCRIPTDIR/build"
cd "$SCRIPTDIR/build" || exit 1

cmake .. \
 -DAliceVision_DIR=$ALICE_VISION_CMAKE_DIR \
 -DCMAKE_FIND_ROOT_PATH=$ALICE_VISION_INSTALL_DIR \
 -DCMAKE_PREFIX_PATH=$QT_DIR \
 -DCMAKE_INSTALL_PREFIX=../install \
 -DCMAKE_BUILD_TYPE=Release \

make -j12 install
