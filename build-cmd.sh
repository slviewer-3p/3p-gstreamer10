#!/bin/bash

VERSION="1.14.5"
SOURCE="gstreamer-${VERSION}"
GST_SOURCE="gst-plugins-base-1.8.1"
stage=`pwd`

pushd ../$SOURCE
  autoreconf
  ./configure -prefix=$stage
  make -j`nproc`
  make install
popd

export PKG_CONFIG_PATH=${stage}/lib/pkgconfig 

pushd ../$GST_SOURCE
  autoreconf
  ./configure -prefix=$stage
  make -j`nproc` 
  make install
popd

echo -n $VERSION > Version.txt
mkdir -p LICENSES
cp ../gstreamer10.txt LICENSES/
