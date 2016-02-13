#!/bin/bash

#  install_dependencies.sh
#
#  :description: post-build script to install wakatime python package
#
#  :maintainer: WakaTime <support@wakatime.com>
#  :license: BSD, see LICENSE for more details.
#  :website: https://wakatime.com/

set -e
set -x

url="https://codeload.github.com/wakatime/wakatime/zip/master"
extract_to="$HOME/Library/Application Support/TextMate/PlugIns/WakaTime.tmplugin/Contents/Resources"
zip_file="$extract_to/wakatime.zip"
installed_package="$extract_to/wakatime-master"

if [ -d "$installed_package" ]; then
    rm -rf "$installed_package"
fi

cd "$extract_to"

echo "Downloading wakatime package to $zip_file ..."
curl "$url" -o "$zip_file"

echo "Unzipping wakatime.zip to $installed_package ..."
unzip -o "$zip_file"

rm "$zip_file"

echo "Finished."
