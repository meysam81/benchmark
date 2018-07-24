-module(benchmark_dict).

-export([init/0,
         get_list/0,
         get_by_name/1,
         get_by_code/1]).

-include("benchmark.hrl").
-include("ingw.hrl").

-define(CODE_INDEX, ingw_object_code_index).
-define(NAME_INDEX, ingw_object_name_index).

-spec get_by_code(ingw_object_codec()) -> {ok, ingw_object_info()} |
                                          {error, undefined_object}.
get_by_code(Code) ->
    case ets:lookup(?CODE_INDEX, Code) of
        [{Code, Name, Actor, Codec}] ->
            {ok, #ingw_object_info{code = Code,
                                   name = Name,
                                   codec = Codec,
                                   actor = Actor}};

        _ ->
            {error, undefined_object}
    end.

-spec get_by_name(ingw_object_name()) -> {ok, ingw_object_info()} |
                                         {error, undefined_object}.
get_by_name(Name) ->
    case ets:lookup(?NAME_INDEX, Name) of
        [{Name, Code, Actor, Codec}] ->
            {ok, #ingw_object_info{code = Code,
                                   name = Name,
                                   codec = Codec,
                                   actor = Actor}};

        _Else ->
            {error, undefined_object}
    end.

-spec init() -> ok.
init() ->
    case ets:info(?CODE_INDEX) of
        undefined ->
            ?CODE_INDEX = ets:new(?CODE_INDEX, [named_table, public]);
        _ ->
            ok
    end,

    case ets:info(?NAME_INDEX) of
        undefined ->
            ?NAME_INDEX = ets:new(?NAME_INDEX, [named_table, public]);
        _ ->
            ok
    end,

    [begin
         ets:insert(?CODE_INDEX, {Code, Name, Actor, Codec}),
         ets:insert(?NAME_INDEX, {Name, Code, Actor, Codec})
     end || #{name := Name,
              code := Code,
              codec := Codec,
              actor := Actor} <- get_list()],

    ok.

-spec get_list() -> list(ingw_object_info()).
get_list() ->
    [
     %% == comn types
     #{code => 1,
       name => 'benchmark.sample.type.Pong',
       codec => benchmark_sample_type,
       actor => undefined},

     #{code => 2,
       name => 'benchmark.sample.type.FactResp',
       codec => benchmark_sample_type,
       actor => undefined},

     %% == comn functions
     #{code => 51,
       name => 'benchmark.sample.func.Ping',
       codec => benchmark_sample_func,
       actor => benchmark_ingw_comn},

     #{code => 52,
       name => 'benchmark.sample.func.Fact',
       codec => benchmark_sample_func,
       actor => benchmark_ingw_comn}
    ].
