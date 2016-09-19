FROM alpine:3.4
MAINTAINER Jean Parpaillon <jean.parpaillon@free.fr>

RUN apk --update-cache upgrade && \
    apk add erlang erlang-dev erlang-crypto erlang-inets erlang-sasl \
      build-base gcc abuild binutils \
      git make perl util-linux pciutils usbutils coreutils binutils findutils grep
