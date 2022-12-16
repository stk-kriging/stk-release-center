#!/bin/bash -ex

I_WAS_HERE=`pwd`

## Syntax: compute-checksums VER
VER=${1}

## Go to release directory
BASE=$(dirname $(readlink -f $0))
RELEASE_DIR=${BASE}/${VER}

## Compute check sums for the github release
cd ${RELEASE_DIR}/github
md5sum *.tar.gz > ${RELEASE_DIR}/github/md5-sums
sha256sum *.tar.gz > ${RELEASE_DIR}/github/sha256-sums

## Compute check sums for the OctaveForge release
cd ${RELEASE_DIR}/octaveforge
md5sum *.tar.gz > ${RELEASE_DIR}/octaveforge/md5-sums
sha256sum *.tar.gz > ${RELEASE_DIR}/octaveforge/sha256-sums

cd ${I_WAS_HERE}

