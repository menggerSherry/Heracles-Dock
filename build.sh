#!/bin/bash

export CC="gcc -O2  -g -fpermissive -fPIC"
export CXX="g++ -O2  -g -fpermissive -fPIC"

# rm -rf build
# mkdir -p build
cd build

cmake  ../source
make VERBOSE=1 -j8
make install 