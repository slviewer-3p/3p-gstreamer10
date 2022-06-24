#!/bin/bash

VERSION="1.14.5"
SOURCE="gstreamer-${VERSION}"
GST_SOURCE="gst-plugins-base-1.8.1"
stage=`pwd`

pushd ../$SOURCE
  ./configure -prefix=$stage
  make -j8
  make install
popd

export PKG_CONFIG_PATH=${stage}/lib/pkgconfig 

pushd ../$GST_SOURCE
  ./configure -prefix=$stage
  make -j8
  make install
popd

echo -n $VERSION > Version.txt
mkdir -p LICENSES
cp ../gstreamer10.txt LICENSES/
