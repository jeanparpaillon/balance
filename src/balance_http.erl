-module(balance_http).

-export([init/2,
         content_types_provided/2,
         to_json/2]).

init(Req, _) ->
  Req2 = cowboy_req:set_resp_header(<<"server">>, application:get_env(balance, server, <<"balance">>), Req),
  {cowboy_rest, Req2, ok}.

content_types_provided(Req, S) ->
  {[
    {{<<"application">>, <<"json">>, '*'}, to_json},
    {{<<"*">>, <<"*">>, '*'}, to_json}
   ], Req, S}.

to_json(Req, S) ->
  Body = #{
    <<"node">> => node(),
    <<"path">> => cowboy_req:path(Req)
   },
  {jsx:encode(Body), Req, S}.
