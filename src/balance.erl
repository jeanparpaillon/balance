-module(balance).

-behaviour(application).
-behaviour(supervisor).

%% application callbacks
-export([start/2, stop/1]).

%% supervisor callbacks
-export([init/1]).

-export([onrequest/1]).

start(normal, _Args) ->
  supervisor:start_link({local, ?MODULE}, ?MODULE, []);

start(_StartType, _Args) ->
  {error, invalid_start}.

stop(Reason) ->
  io:format("Balance stopped: ~p~n", [Reason]),
  ok.

init(_) ->
  Dispatch = cowboy_router:compile([{'_',
                                     [{"/[...]", balance_http, []}]
                                    }
                                   ]),
  HttpArgs = [
              http, 10,
              [{port, application:get_env(balance, port, 8080)}],
              [{env, [{dispatch, Dispatch}]}, {fun onrequest/1}]
             ],
  Http = #{
    id => balance_http,
    start => {cowboy, start_http, HttpArgs},
    type => worker
   },
  {ok, {{one_for_one, 10, 10}, [Http]}}.


onrequest(Req) ->
  Method = cowboy_req:method(Req),
  Path = cowboy_req:path(Req),
  Version = cowboy_req:version(Req),
  Hdrs = cowboy_req:headers(Req),
  io:format("~s ~s ~s~n", [Method, Path, Version]),
  lists:map(fun ({K, V}) ->
                io:format("\t~s: ~s", [K, V])
            end, Hdrs),
  Req.
