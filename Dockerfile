FROM ubuntu:16.04

#------------------------------------------------------------------------------
# Environment variables:
#------------------------------------------------------------------------------

RUN apt update \
  && apt install software-properties-common -y \
  && add-apt-repository ppa:max-c-lv/shadowsocks-libev -y \
  && apt update \
  && apt install -y shadowsocks-libev privoxy

ENV SERVER_ADDR=127.0.0.1 \
    SERVER_PORT=1080  \
    METHOD=chacha20-ietf-poly1305 \
    TIMEOUT=300 \
    PASSWORD=xxx

#------------------------------------------------------------------------------
# Populate root file system:
#------------------------------------------------------------------------------

ADD rootfs /

#------------------------------------------------------------------------------
# Expose ports and entrypoint:
#------------------------------------------------------------------------------
EXPOSE 8118 7070

ENTRYPOINT ["/entrypoint.sh"]
