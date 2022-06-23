#!/bin/bash

VERSION="1.6.4"
SOURCE="gstreamer-${VERSION}"

stage=`pwd`
echo $stage

pushd ../$SOURCE
./configure -prefix=$stage
make -j8
make install
popd

echo -n $VERSION > Version.txt
mkdir -p LICENSES
cp ../gstreamer10.txt LICENSES/
