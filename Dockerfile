FROM msaraiva/elixir
MAINTAINER Jean Parpaillon <jean.parpaillon@free.fr>

EXPOSE 80

ADD _rel/balance /srv/balance

WORKDIR = /srv/balance
ENTRYPOINT = [ "/srv/balance/bin/balance" ]
CMD = [ "foreground" ]
