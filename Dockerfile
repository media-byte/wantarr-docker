FROM alpine:latest

RUN apk add --no-cache wget
RUN apk add --no-cache tar
RUN wget -qO - https://api.github.com/repos/l3uddz/wantarr/releases/latest  \
      | grep browser_download_url \
      | grep linux_amd64 \
      | cut -d  '"' -f 4 \
      | wget -cqi - -O wantarr.tar.tgz
RUN ["tar", "-xvzf", "wantarr.tar.tgz"]
RUN ["chmod", "+x", "wantarr"]
ENTRYPOINT ["ls -a"]
