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

cp lib/gstreamer-1.0/include/gst/* include/gstreamer-1.0/gst/
echo -n $VERSION > Version.txt
mkdir -p LICENSES
cp ../gstreamer10.txt LICENSES/
