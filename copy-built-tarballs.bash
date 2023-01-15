#!/bin/bash -ex

## Syntax: copy-built-tarballs VER BUILDIR
VER=${1}
BUILD_DIR=${2}

## Create directoriy
BASE=$(dirname $(readlink -f $0))
RELEASE_DIR=${BASE}/release/${VER}/
mkdir -p ${RELEASE_DIR}

## Copy tarballs
cp ${BUILD_DIR}/stk-${VER}-*.tar.gz ${RELEASE_DIR}
