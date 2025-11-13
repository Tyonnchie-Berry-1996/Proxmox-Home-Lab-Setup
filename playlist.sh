#!/usr/bin/bash

cd /home/$(whoami)/src/

sh git-remote-fetch || true
sh git-pull.sh || true

cd /home/$(whoami)/src/app-m3u-generator/playlists

cat *_us.m3u >> ~/Desktop/custom-playlist/custom_playlist.m3u
cat *_ca.m3u >> ~/Desktop/custom-playlist/custom_playlist.m3u

#cat stirr_all.m3u
#cat tubi_all.m3u
