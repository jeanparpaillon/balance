-module(balance_http).

-export([init/2,
	content_types_provided/2,
	 get/2]).

init(Req, _) ->
    {cowboy_rest, Req, ok}.

content_types_provided(Req, S) ->
    {[{{'*', '*', '*'}, get}], Req, S}.

get(Req, S) ->
    {io_lib:format("~s~n", [node()]), Req, S}.
