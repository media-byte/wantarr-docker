FROM alpine:latest

RUN apk add --no-cache wget tar
RUN wget -qO - https://api.github.com/repos/media-byte/wantarr-docker/releases/latest  \
      | grep browser_download_url \
      | grep wantarr \
      | cut -d  '"' -f 4 \
      | wget -cqi - -O wantarr

RUN ["chmod", "+x", "wantarr"]

CMD ls
