FROM debian:latest

# Dependencies
RUN apt-get update && \
    apt-get install -y ffmpeg curl && \
    rm -rf /var/lib/apt/lists/* && \
    curl -L https://github.com/static-web-server/static-web-server/releases/download/v2.28.0/static-web-server-v2.28.0-x86_64-unknown-linux-gnu.tar.gz | tar -xz -C /usr/local/bin --strip-components=1 && \
    chmod a+rx /usr/local/bin/static-web-server && \
    curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o /usr/local/bin/yt-dlp && \
    chmod a+rx /usr/local/bin/yt-dlp

COPY run.sh . 

ENTRYPOINT ["./run.sh"]
