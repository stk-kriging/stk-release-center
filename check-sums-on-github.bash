#!/bin/bash -ex

WGET="wget https://github.com/stk-kriging/stk/releases/download/"
VER=${1}

BASE=$(dirname $(readlink -f $0))
HERE=${BASE}/${VER}

DST=${HERE}/download/github
mkdir -p ${DST}

FN=stk-${VER}-allpurpose.tar.gz
${WGET}${VER}/${FN}
mv ${FN} ${DST}

FN=stk-${VER}-octpkg.tar.gz
${WGET}${VER}/${FN}
mv ${FN} ${DST}

# Check sums
cd ${DST}
md5sum -c ${HERE}/md5-sums
sha256sum -c ${HERE}/sha256-sums
