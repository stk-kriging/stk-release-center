#!/bin/bash -ex

I_WAS_HERE=`pwd`

WGET="wget https://github.com/stk-kriging/stk/releases/download/"
VER=${1}

BASE=$(dirname $(readlink -f $0))
RELEASE_DIR=${BASE}/${VER}

DOWNLOAD_DIR=${RELEASE_DIR}/download/github
mkdir -p ${DOWNLOAD_DIR}
cd ${DOWNLOAD_DIR}

FN=stk-${VER}-allpurpose.tar.gz
${WGET}${VER}/${FN}

FN=stk-${VER}-octpkg.tar.gz
${WGET}${VER}/${FN}

cd ${I_WAS_HERE}
