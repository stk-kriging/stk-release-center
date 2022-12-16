#!/bin/bash -ex

## Syntax: copy-built-tarballs VER BUILDIR
VER=${1}
BUILD_DIR=${2}

## Create directories
BASE=$(dirname $(readlink -f $0))
RELEASE_DIR=${BASE}/${VER}
mkdir -p ${RELEASE_DIR}/github
mkdir -p ${RELEASE_DIR}/octaveforge

cp ${BUILD_DIR}/github/*.tar.gz ${RELEASE_DIR}/github/
cp ${BUILD_DIR}/octaveforge/*.tar.gz ${RELEASE_DIR}/octaveforge/
