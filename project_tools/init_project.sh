#!/usr/bin/env bash

PROJECT_NAME=${PWD##*/}

SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  RUNDIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
RUNDIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"
ROOTDIR="$( cd -P "$( dirname "$RUNDIR/.././" )" >/dev/null 2>&1 && pwd )"
echo "This is golang develop project tools"
echo "script run at ${RUNDIR}"
echo "project root at ${ROOTDIR}"

cd "${ROOTDIR}" || exit
git init
mkdir -p doc/install
mkdir -p doc/man
mkdir -p out
mkdir -p tools
mkdir -p 3rd/out
mkdir -p deploy
mkdir -p design/assets
mkdir -p design/doc
mkdir -p web
mkdir -p web/img
mkdir -p web/scripts
mkdir -p web/css
mkdir -p web/templates
mkdir -p build/docker
mkdir -p build/vagrant
mkdir -p build/shell
mkdir -p module_srcs
mkdir -p config/debug
mkdir -p config/release
mkdir -p db/src
mkdir -p db/doc
mkdir -p db/release
mkdir -p db/debug
touch doc/install/.init
touch doc/.init
touch doc/man/.init
touch tools/.init
touch 3rd/out/.init
touch deploy/.init
touch design/assets/.init
touch design/doc/design.md
touch web/.init
touch build/docker/.init
touch build/shell/.init
touch build/vagrant/.init
touch db/src/.init
touch db/doc/.init
touch db/release/.init
touch db/debug/.init
mkdir -p config/debug/.init
mkdir -p config/release/.init
echo "This Script create by Victor Ho"

cat ${RUNDIR}/readme.md

echo "let start from here! now you will hunt happy!"
