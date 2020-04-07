#!/bin/bash -ex

I_WAS_HERE=`pwd`

VER=${1}

BASE=$(dirname $(readlink -f $0))

RELEASE_DIR=${BASE}/${VER}

MD5SUMS=${RELEASE_DIR}/md5-sums
if [ ! -f ${MD5SUMS} ]; then
    echo "File ${MD5SUMS} does not exist."
    exit 1
fi

SHA256SUMS=${RELEASE_DIR}/sha256-sums
if [ ! -f ${SHA256SUMS} ]; then
    echo "File ${SHA256SUMS} does not exist."
    exit 1
fi

OCTPKG=${RELEASE_DIR}/download/github/stk-${VER}-octpkg.tar.gz
if [ ! -f ${OCTPKG} ]; then
    echo "File ${OCTPKG} does not exist."
    exit 1
fi

PUBDATE=`tar -zxOf ${OCTPKG} | grep "Date:" | sed -e "s/Date:\s*//"`

sed -e "/MD5SUMS/r ${MD5SUMS}"       \
    -e "/SHA256SUMS/r ${SHA256SUMS}" \
    -e "s/PUBDATE/${PUBDATE}/"       \
    -e "s/VERNUM/${VER}/g"           release-template.md \
    | sed -e "/MD5SUMS/d"            \
          -e "/SHA256SUMS/d"         > ${RELEASE_DIR}/github-release.md

