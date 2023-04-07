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

if [ "$(uname -m)" = "arm64" ]; then
    arch="arm64"
elif [ "$(uname -m)" = "x86_64" ]; then
    arch="amd64"
fi

basename="wakatime-cli"
filename="${basename}-darwin-${arch}"
zip_file="${filename}.zip"
url="https://github.com/wakatime/wakatime-cli/releases/latest/download/${zip_file}"
extract_to="${HOME}/.wakatime"
old_package="${HOME}/Library/Application Support/TextMate/PlugIns/WakaTime.tmplugin/Contents/Resources/legacy-python-cli-master"

cd "$extract_to"

echo "Deleting old packages ..."
if [ -d "$old_package" ]; then
    rm -rf "$old_package"
fi

if [ -f "$filename" ]; then
    rm -rf "$filename"
fi

echo "Downloading wakatime-cli package to $extract_to ..."
curl -LO "$url"

echo "Unzipping wakatime-cli to $extract_to ..."
unzip -o "$zip_file"
ln -sf "$filename" "$basename"

rm "$zip_file"

echo "Finished."
