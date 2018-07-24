-module(benchmark_app).

-behaviour(application).

%% Application callbacks
-export([start/2, stop/1]).

%%====================================================================
%% API
%%====================================================================

start(_StartType, _StartArgs) ->
    application:ensure_started(toveri),

    my_app_dict:init(),

    {ok, _} = toveri:new(my_toveri, 8),
    ok = toveri:add_child(my_toveri, {benchmark_actor, start_link, []}, 8),

    benchmark_sup:start_link().

%%--------------------------------------------------------------------
stop(_State) ->
    ok.

%%====================================================================
%% Internal functions
%%====================================================================
