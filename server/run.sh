#!/usr/bin/env bash
set -e 

mkdir -p public 

static-web-server --port 8080 --cors-allow-origins "*" &

cd public 

youtube_url="https://www.youtube.com/watch?v=jfKfPfyJRdk"

hls_url=$(yt-dlp -f worst -g $youtube_url)

ffmpeg -i "$hls_url" \
    -c:a copy \
    -ac 2 \
    -vn \
    -f hls \
    -hls_time 5 \
    -hls_flags delete_segments \
    -hls_list_size 4 \
    -hide_banner \
    -loglevel error \
    -http_multiple 0 \
    stream.m3u8
