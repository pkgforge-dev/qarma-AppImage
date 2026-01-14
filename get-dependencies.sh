#!/bin/sh

set -eu

ARCH=$(uname -m)

echo "Installing package dependencies..."
echo "---------------------------------------------------------------"
# pacman -Syu --noconfirm PACKAGESHERE

echo "Installing debloated packages..."
echo "---------------------------------------------------------------"
get-debloated-pkgs --add-common --prefer-nano

# Comment this out if you need an AUR package
make-aur-package https://github.com/luebking/qarma

# symlink qarma as zenity so that window class matches when used as zenity
ln -sf qarma /usr/bin/zenity

# simple qt app should work without hardware accel
pacman -Rdd --noconfirm mesa
