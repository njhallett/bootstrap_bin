#!/bin/sh
mkdir -p $HOME/bin
if [[ $PATH != *"$HOME/bin"* ]]; then export PATH=$PATH:$HOME/bin; fi
json=`curl -s https://api.github.com/repos/marcosnils/bin/releases/latest`
url=`echo $json | jq -r '.assets[] | select(.browser_download_url | contains("Linux_x86_64")) | .browser_download_url'`
name=`echo $json | jq -r '.assets[] | select(.name | contains("Linux_x86_64")) | .name'`
curl -fsLJO $url -o $name
chmod +x $name
./$name install github.com/marcosnils/bin
rm $name
