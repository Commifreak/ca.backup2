#!/bin/bash
DIR="$(dirname "$(readlink -f ${BASH_SOURCE[0]})")"
tmpdir=/tmp/tmp.$(( $RANDOM * 19318203981230 + 40 ))
plugin=$(basename ${DIR})
archive="$(dirname $(dirname ${DIR}))/archive"
version=$(date +"%Y.%m.%d")$1

mkdir -p $tmpdir/$DIR

cp --parents -f $(find . -type f ! \( -iname "pkg_build.sh" -o -iname "sftp-config.json"  \) ) $tmpdir/$DIR/
cd $tmpdir
chmod 0755 -R .
makepkg -l y -c y /tmp/${plugin}-${version}-x86_64-1.txz
rm -rf $tmpdir
echo "MD5:"
md5sum /tmp/${plugin}-${version}-x86_64-1.txz

