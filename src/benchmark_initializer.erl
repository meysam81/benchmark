-module(benchmark_initializer).

-export([start/2]).

-export([init/2]).

start(ToveriRef, NumberOfClients) ->
    spawn(benchmark_initializer, init, [ToveriRef, NumberOfClients]).

init(ToveriRef, NumberOfClients) ->
    init(ToveriRef, NumberOfClients, 0).
init(_, NumberOfClients, NumberOfClients) ->
    ok;
init(ToveriRef, NumberOfClients, ClientsStartedSoFar) ->
    {ok, Pid} = benchmark_client:start_link(),

    case ClientsStartedSoFar rem 2 of
        0 ->
            Request = ping;
        1 ->
            Request = fact;
        _ ->
            Request = false
    end,

    gen_server:cast(Pid, {Request, ToveriRef}),

    init(ToveriRef, NumberOfClients, ClientsStartedSoFar + 1).
