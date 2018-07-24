-module(benchmark_actor).

-behaviour(gen_server).

%% API
-export([start_link/0]).

%% gen_server callbacks
-export([init/1, handle_call/3, handle_cast/2, handle_info/2,
         terminate/2, code_change/3, format_status/2]).

-include("benchmark.hrl").
-include("ingw.hrl").
-include("my_app_sample_func.hrl").
-include("my_app_sample_type.hrl").

-define(SERVER, ?MODULE).

-record(state, {socket, host, port, tracking_id, client}).

%%%===================================================================
%%% API
%%%===================================================================
start_link() ->
    gen_server:start_link(?MODULE, [1], []).

%%%===================================================================
%%% gen_server callbacks
%%%===================================================================


%% ------------------------- init -----------------------------------
init([Tid]) ->

    Host = localhost,
    Port = 3830,

    State = #state{host = Host,
                   port = Port,
                   tracking_id = Tid,
                   client = []},


    {ok, State}.



%% ------------------------- call -----------------------------------
handle_call(_Request, _From, State) ->
    Reply = ok,
    {reply, Reply, State}.



%% ------------------------- cast -----------------------------------
handle_cast({ping, From}, #state{host = Host,
                            port = Port,
                            tracking_id = Tid,
                            client = Client} = State) ->
    {ok, Socket} = gen_tcp:connect(Host, Port, [binary]),

    P = #ingw_message{object =  #'my_app.sample.func.Ping'{},
                      type = request,
                      flags = 2#00100000,
                      tracking_id = Tid},
    {ok, Ping, _Tid} = my_app_codec:encode_frame(P),

    ok = gen_tcp:send(Socket, Ping),

    {noreply, State#state{tracking_id = Tid + 1,
                            client = [{Tid, From} | Client]}};
handle_cast({fact, From}, #state{host = Host,
                            port = Port,
                            tracking_id = Tid,
                            client = Client} = State) ->

    {ok, Socket} = gen_tcp:connect(Host, Port, [binary]),

    P = #ingw_message{object =  #'my_app.sample.func.Fact'{'N' = 7},
                      type = request,
                      flags = 2#00100000,
                      tracking_id = Tid},
    {ok, Ping, _Tid} = my_app_codec:encode_frame(P),

    ok = gen_tcp:send(Socket, Ping),

    {noreply, State#state{tracking_id = Tid + 1,
                            client = [{Tid, From} | Client]}};
handle_cast(_Request, State) ->
    {noreply, State}.




%% ------------------------- info -----------------------------------
handle_info({tcp, _Socket, BinObj}, #state{client = Client} = State) ->
    {ok, #ingw_message{tracking_id = Tid} = Result} =
        my_app_codec:decode_frame(BinObj),

    %% Requester = proplist:get_value(Tid, Client),
    ?LOG_DEBUG("Tid: ~p, Result: ~p", [Tid, Result]),
    %% %% ok = gen_server:cast(Requester, Result),

    {noreply, State
     %% #state{client = proplist:delete(Tid, Client)}
    };
handle_info(_Info, State) ->
    {noreply, State}.




terminate(_Reason, _State) ->
    ok.
code_change(_OldVsn, State, _Extra) ->
    {ok, State}.
format_status(_Opt, Status) ->
    Status.

%%%===================================================================
%%% Internal functions
%%%===================================================================
