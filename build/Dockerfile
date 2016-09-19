FROM alpine:3.4
MAINTAINER Jean Parpaillon <jean.parpaillon@free.fr>

RUN apk --update-cache upgrade && \
    apk add \
      erlang erlang-xmerl erlang-dialyzer erlang-cosproperty erlang-parsetools erlang-costime \
      erlang-test-server erlang-percept erlang-sasl erlang-stdlib erlang-runtime-tools \
      erlang-ssh erlang-erl-docgen erlang-eunit erlang-inets erlang-orber erlang-cosfiletransfer \
      erlang-tools erlang-snmp erlang-et erlang-ic erlang-dev erlang-debugger erlang-jinterface \
      erlang-typer erlang-asn1 erlang-erl-interface erlang-hipe erlang-cosnotification \
      erlang-odbc erlang-ose erlang-otp-mibs erlang-reltool erlang-crypto erlang-common-test \
      erlang-ssl erlang-mnesia erlang-cosevent erlang-compiler erlang-os-mon erlang-erts \
      erlang-costransaction erlang-public-key erlang-syntax-tools erlang-gs erlang-observer \
      erlang-edoc erlang-kernel erlang-webtool erlang-eldap erlang-coseventdomain \
      erlang-megaco erlang-diameter \
      build-base gcc abuild binutils \
      git make perl util-linux pciutils usbutils coreutils binutils findutils grep
