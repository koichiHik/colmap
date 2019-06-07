#!/bin/bash

ROOT_3RD=~/workspace/3rdParty
#CMAKE_BUILD_TYPE=Debug
CMAKE_BUILD_TYPE=Release
Ceres_DIR=${ROOT_3RD}/google_ceres_solver/install/lib/cmake

CMAKE_BIN=${ROOT_3RD}/cmake_repo/cmake-3.13.3/install/bin/cmake
CMAKE_MODULE_PATH=${ROOT_3RD}/cmake_repo/cmake-3.13.3/install/share/cmake-3.13/Modules

cd ..

if [ ! -e ./build ]; then
  mkdir build
fi
cd build

${CMAKE_BIN} \
  -D CMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE} \
  -D CMAKE_INSTALL_PREFIX="../install" \
  -D CERES_DIR=${Ceres_DIR} \
  -D CMAKE_MODULE_PATH=${CMAKE_MODULE_PATH} \
  ../colmap

make -j32

cd ../colmap
