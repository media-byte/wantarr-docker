FROM ghcr.io/linuxserver/baseimage-ubuntu:focal

RUN apt-get install -y wget
RUN wget -qO - https://api.github.com/repos/l3uddz/wantarr/releases/latest  \
      | grep browser_download_url \
      | grep wantarr_linux_amd64.tar.tgz \
      | cut -d  '"' -f 4 \
      | wget -cqi - \
&& tar xvf wantarr_linux_amd64.tar.tgz   

ENTRYPOINT ["./wantarr"]
