#!/bin/bash -ex

I_WAS_HERE=`pwd`

## Syntax: compute-checksums VER
VER=${1}

## Go to release directory
BASE=$(dirname $(readlink -f $0))
RELEASE_DIR=${BASE}/release/${VER}

## Compute check sums for the github release
cd ${RELEASE_DIR}
md5sum *.tar.gz > ${RELEASE_DIR}/md5-sums
sha256sum *.tar.gz > ${RELEASE_DIR}/sha256-sums

cd ${I_WAS_HERE}
