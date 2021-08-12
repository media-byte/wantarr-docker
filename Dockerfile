FROM alpine:latest

RUN apk add --no-cache wget tar
RUN wget -qO - https://api.github.com/repos/l3uddz/wantarr/releases/latest  \
      | grep browser_download_url \
      | grep linux_amd64 \
      | cut -d  '"' -f 4 \
      | wget -cqi - \
&& tar -xf wantarr_linux_amd64.tar.tgz

COPY wantarr /opt

WORKDIR /opt
RUN ["chmod", "+x", "wantarr"]

ENTRYPOINT ["./wantarr"]
