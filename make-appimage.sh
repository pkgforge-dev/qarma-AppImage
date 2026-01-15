#!/bin/sh

set -eu

ARCH=$(uname -m)
VERSION=$(pacman -Q qarma | awk '{print $2; exit}') # example command to get version of application here
export ARCH VERSION
export OUTPATH=./dist
export UPINFO="gh-releases-zsync|${GITHUB_REPOSITORY%/*}|${GITHUB_REPOSITORY#*/}|latest|*$ARCH.AppImage.zsync"
export ICON=DUMMY
export DESKTOP=DUMMY
export MAIN_BIN=qarma
export ANYLINUX_LIB=1

# Deploy dependencies
quick-sharun /usr/bin/qarma* /usr/bin/zenity

# needed since this app puts the whole binary path as argv0
echo 'OVERRIDE_ARGV0=${ARG0}' >> ./AppDir/.env

# Additional changes can be done in between here

# Turn AppDir into AppImage
quick-sharun --make-appimage
