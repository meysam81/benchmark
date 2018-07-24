-module(benchmark_client).

-behaviour(gen_server).

%% API
-export([start_link/0]).

%% gen_server callbacks
-export([init/1,
         handle_call/3, handle_cast/2, handle_info/2,
         terminate/2, code_change/3, format_status/2]).
-include("benchmark.hrl").
-include("ingw.hrl").
-include("my_app_sample_type.hrl").
-define(SERVER, ?MODULE).

-record(state, {request_type}).

%%%===================================================================
%%% API
%%%===================================================================
start_link() ->
    gen_server:start_link(?MODULE, [], []).

%%%===================================================================
%%% gen_server callbacks
%%%===================================================================
init([]) ->
    {ok, #state{}}.




handle_call(_Request, _From, State) ->
    Reply = ok,
    {reply, Reply, State}.





handle_cast({ping, ToveriRef}, State) ->
    {ok, Pid} = toveri:get_pid(ToveriRef),


    gen_server:cast(Pid, {ping, self()}),


    {noreply, State#state{request_type = ping}};
handle_cast({fact, ToveriRef}, State) ->
    {ok, Pid} = toveri:get_pid(ToveriRef),


    gen_server:cast(Pid, {fact, self()}),


    {noreply, State#state{request_type = fact}};
handle_cast(#ingw_message{object = Obj},
            #state{request_type = ReqType} = State) ->
    case Obj of
        #'my_app.sample.type.Pong'{} ->
            Result = pong;
        #'my_app.sample.type.FactResp'{} ->
            Result = fact_resp;
        _ ->
            Result = false
    end,


    ?LOG_INFO("I'm ~p, I asked for ~p, and got ~p",
              [self(), ReqType, Result]),


    {noreply, State};
handle_cast(_Request, State) ->
    ?LOG_DEBUG("Request: ~p", [_Request]),
    {noreply, State}.





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
