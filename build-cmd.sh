#!/bin/bash

VERSION="1.14.5"
SOURCE="gstreamer-${VERSION}"
GST_SOURCE="gst-plugins-base-1.8.1"
stage=`pwd`

mkdir -p include
cp -a /usr/include/gstreamer-1.0 include

echo -n $VERSION > Version.txt
mkdir -p LICENSES
cp ../gstreamer10.txt LICENSES/
