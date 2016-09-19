-module(balance_http).

-export([init/2,
         content_types_provided/2,
         to_json/2]).

init(Req, _) ->
  {cowboy_rest, Req, ok}.

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
