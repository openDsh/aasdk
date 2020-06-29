#!/bin/bash

# Clear out the /build and /release directory
rm -rf /build/*
rm -rf /release/*

BUILD_VERSION=$(git rev-parse --short HEAD)
BUILD_VERSION_TAG=$(git describe --tags $(git rev-list --tags --max-count=1))
git checkout ${BUILD_VERSION}

# Configure, make, make install
mkdir /aasdk_build; cd /aasdk_build
cmake -DCMAKE_BUILD_TYPE=Release ../src
make -j4
fakeroot make install DESTDIR=/build

# Get the Install Size
INSTALL_SIZE=$(du -s /build/usr | awk '{ print $1 }')

# Make DEBIAN directory in /build
mkdir -p /build/DEBIAN

# Copy the control file from resources
cp /src/resources/control.in /build/DEBIAN/control

# Fill in the information in the control file
sed -i "s/__VERSION__/${BUILD_VERSION:1}/g" /build/DEBIAN/control
sed -i "s/__FILESIZE__/${INSTALL_SIZE}/g" /build/DEBIAN/control

# Build our Debian package
fakeroot dpkg-deb -b "/build"

# Move it to release
mv /build.deb /release/aasdk-${BUILD_VERSION}-amd64.deb
