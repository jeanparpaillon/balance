FROM msaraiva/elixir
MAINTAINER Jean Parpaillon <jean.parpaillon@free.fr>

ADD _rel/balance /srv/balance

ENTRYPOINT = [ "/srv/balance/bin/balance" ]

EXPOSE 80
