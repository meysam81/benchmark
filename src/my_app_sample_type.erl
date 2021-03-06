%% Automatically generated, do not edit
%% Generated by gpb_compile version 3.21.0 on {{2018,7,24},{14,2,37}}
-module(my_app_sample_type).

-export([encode_msg/1, encode_msg/2]).
-export([decode_msg/2]).
-export([merge_msgs/2]).
-export([verify_msg/1]).
-export([get_msg_defs/0]).
-export([get_msg_names/0]).
-export([get_enum_names/0]).
-export([find_msg_def/1, fetch_msg_def/1]).
-export([find_enum_def/1, fetch_enum_def/1]).
-export([enum_symbol_by_value/2, enum_value_by_symbol/2]).
-export([get_service_names/0]).
-export([get_service_def/1]).
-export([get_rpc_names/1]).
-export([find_rpc_def/2, fetch_rpc_def/2]).
-export([get_package_name/0]).
-export([gpb_version_as_string/0, gpb_version_as_list/0]).

-include("my_app_sample_type.hrl").
-include("gpb.hrl").



encode_msg(Msg) -> encode_msg(Msg, []).


encode_msg(Msg, Opts) ->
    case proplists:get_bool(verify, Opts) of
      true -> verify_msg(Msg);
      false -> ok
    end,
    case Msg of
      #'my_app.sample.type.FactResp'{} ->
	  'e_msg_my_app.sample.type.FactResp'(Msg);
      #'my_app.sample.type.Pong'{} ->
	  'e_msg_my_app.sample.type.Pong'(Msg)
    end.


'e_msg_my_app.sample.type.FactResp'(Msg) ->
    'e_msg_my_app.sample.type.FactResp'(Msg, <<>>).


'e_msg_my_app.sample.type.FactResp'(#'my_app.sample.type.FactResp'{resp
								       = F1},
				    Bin) ->
    e_type_int32(F1, <<Bin/binary, 8>>).

'e_msg_my_app.sample.type.Pong'(Msg) ->
    'e_msg_my_app.sample.type.Pong'(Msg, <<>>).


'e_msg_my_app.sample.type.Pong'(#'my_app.sample.type.Pong'{'FirstLittleId'
							       = F1,
							   'SecondLittleId' =
							       F2,
							   'LongId' = F3},
				Bin) ->
    B1 = e_type_int32(F1, <<Bin/binary, 8>>),
    B2 = e_type_int32(F2, <<B1/binary, 16>>),
    if F3 == undefined -> B2;
       true -> e_type_int64(F3, <<B2/binary, 24>>)
    end.



e_type_int32(Value, Bin)
    when 0 =< Value, Value =< 127 ->
    <<Bin/binary, Value>>;
e_type_int32(Value, Bin) ->
    <<N:64/unsigned-native>> = <<Value:64/signed-native>>,
    e_varint(N, Bin).

e_type_int64(Value, Bin)
    when 0 =< Value, Value =< 127 ->
    <<Bin/binary, Value>>;
e_type_int64(Value, Bin) ->
    <<N:64/unsigned-native>> = <<Value:64/signed-native>>,
    e_varint(N, Bin).

e_varint(N, Bin) when N =< 127 -> <<Bin/binary, N>>;
e_varint(N, Bin) ->
    Bin2 = <<Bin/binary, (N band 127 bor 128)>>,
    e_varint(N bsr 7, Bin2).



decode_msg(Bin, MsgName) when is_binary(Bin) ->
    case MsgName of
      'my_app.sample.type.FactResp' ->
	  'd_msg_my_app.sample.type.FactResp'(Bin);
      'my_app.sample.type.Pong' ->
	  'd_msg_my_app.sample.type.Pong'(Bin)
    end.



'd_msg_my_app.sample.type.FactResp'(Bin) ->
    'dfp_read_field_def_my_app.sample.type.FactResp'(Bin, 0,
						     0, id(undefined)).

'dfp_read_field_def_my_app.sample.type.FactResp'(<<8,
						   Rest/binary>>,
						 Z1, Z2, F1) ->
    'd_field_my_app.sample.type.FactResp_resp'(Rest, Z1, Z2,
					       F1);
'dfp_read_field_def_my_app.sample.type.FactResp'(<<>>,
						 0, 0, F1) ->
    #'my_app.sample.type.FactResp'{resp = F1};
'dfp_read_field_def_my_app.sample.type.FactResp'(Other,
						 Z1, Z2, F1) ->
    'dg_read_field_def_my_app.sample.type.FactResp'(Other,
						    Z1, Z2, F1).

'dg_read_field_def_my_app.sample.type.FactResp'(<<1:1,
						  X:7, Rest/binary>>,
						N, Acc, F1)
    when N < 32 - 7 ->
    'dg_read_field_def_my_app.sample.type.FactResp'(Rest,
						    N + 7, X bsl N + Acc, F1);
'dg_read_field_def_my_app.sample.type.FactResp'(<<0:1,
						  X:7, Rest/binary>>,
						N, Acc, F1) ->
    Key = X bsl N + Acc,
    case Key of
      8 ->
	  'd_field_my_app.sample.type.FactResp_resp'(Rest, 0, 0,
						     F1);
      _ ->
	  case Key band 7 of
	    0 ->
		'skip_varint_my_app.sample.type.FactResp'(Rest, 0, 0,
							  F1);
	    1 ->
		'skip_64_my_app.sample.type.FactResp'(Rest, 0, 0, F1);
	    2 ->
		'skip_length_delimited_my_app.sample.type.FactResp'(Rest,
								    0, 0, F1);
	    5 ->
		'skip_32_my_app.sample.type.FactResp'(Rest, 0, 0, F1)
	  end
    end;
'dg_read_field_def_my_app.sample.type.FactResp'(<<>>, 0,
						0, F1) ->
    #'my_app.sample.type.FactResp'{resp = F1}.

'd_field_my_app.sample.type.FactResp_resp'(<<1:1, X:7,
					     Rest/binary>>,
					   N, Acc, F1)
    when N < 57 ->
    'd_field_my_app.sample.type.FactResp_resp'(Rest, N + 7,
					       X bsl N + Acc, F1);
'd_field_my_app.sample.type.FactResp_resp'(<<0:1, X:7,
					     Rest/binary>>,
					   N, Acc, _) ->
    <<NewFValue:32/signed-native>> = <<(X bsl N +
					  Acc):32/unsigned-native>>,
    'dfp_read_field_def_my_app.sample.type.FactResp'(Rest,
						     0, 0, NewFValue).


'skip_varint_my_app.sample.type.FactResp'(<<1:1, _:7,
					    Rest/binary>>,
					  Z1, Z2, F1) ->
    'skip_varint_my_app.sample.type.FactResp'(Rest, Z1, Z2,
					      F1);
'skip_varint_my_app.sample.type.FactResp'(<<0:1, _:7,
					    Rest/binary>>,
					  Z1, Z2, F1) ->
    'dfp_read_field_def_my_app.sample.type.FactResp'(Rest,
						     Z1, Z2, F1).


'skip_length_delimited_my_app.sample.type.FactResp'(<<1:1,
						      X:7, Rest/binary>>,
						    N, Acc, F1)
    when N < 57 ->
    'skip_length_delimited_my_app.sample.type.FactResp'(Rest,
							N + 7, X bsl N + Acc,
							F1);
'skip_length_delimited_my_app.sample.type.FactResp'(<<0:1,
						      X:7, Rest/binary>>,
						    N, Acc, F1) ->
    Length = X bsl N + Acc,
    <<_:Length/binary, Rest2/binary>> = Rest,
    'dfp_read_field_def_my_app.sample.type.FactResp'(Rest2,
						     0, 0, F1).


'skip_32_my_app.sample.type.FactResp'(<<_:32,
					Rest/binary>>,
				      Z1, Z2, F1) ->
    'dfp_read_field_def_my_app.sample.type.FactResp'(Rest,
						     Z1, Z2, F1).


'skip_64_my_app.sample.type.FactResp'(<<_:64,
					Rest/binary>>,
				      Z1, Z2, F1) ->
    'dfp_read_field_def_my_app.sample.type.FactResp'(Rest,
						     Z1, Z2, F1).


'd_msg_my_app.sample.type.Pong'(Bin) ->
    'dfp_read_field_def_my_app.sample.type.Pong'(Bin, 0, 0,
						 id(undefined), id(undefined),
						 id(undefined)).

'dfp_read_field_def_my_app.sample.type.Pong'(<<8,
					       Rest/binary>>,
					     Z1, Z2, F1, F2, F3) ->
    'd_field_my_app.sample.type.Pong_FirstLittleId'(Rest,
						    Z1, Z2, F1, F2, F3);
'dfp_read_field_def_my_app.sample.type.Pong'(<<16,
					       Rest/binary>>,
					     Z1, Z2, F1, F2, F3) ->
    'd_field_my_app.sample.type.Pong_SecondLittleId'(Rest,
						     Z1, Z2, F1, F2, F3);
'dfp_read_field_def_my_app.sample.type.Pong'(<<24,
					       Rest/binary>>,
					     Z1, Z2, F1, F2, F3) ->
    'd_field_my_app.sample.type.Pong_LongId'(Rest, Z1, Z2,
					     F1, F2, F3);
'dfp_read_field_def_my_app.sample.type.Pong'(<<>>, 0, 0,
					     F1, F2, F3) ->
    #'my_app.sample.type.Pong'{'FirstLittleId' = F1,
			       'SecondLittleId' = F2, 'LongId' = F3};
'dfp_read_field_def_my_app.sample.type.Pong'(Other, Z1,
					     Z2, F1, F2, F3) ->
    'dg_read_field_def_my_app.sample.type.Pong'(Other, Z1,
						Z2, F1, F2, F3).

'dg_read_field_def_my_app.sample.type.Pong'(<<1:1, X:7,
					      Rest/binary>>,
					    N, Acc, F1, F2, F3)
    when N < 32 - 7 ->
    'dg_read_field_def_my_app.sample.type.Pong'(Rest, N + 7,
						X bsl N + Acc, F1, F2, F3);
'dg_read_field_def_my_app.sample.type.Pong'(<<0:1, X:7,
					      Rest/binary>>,
					    N, Acc, F1, F2, F3) ->
    Key = X bsl N + Acc,
    case Key of
      8 ->
	  'd_field_my_app.sample.type.Pong_FirstLittleId'(Rest, 0,
							  0, F1, F2, F3);
      16 ->
	  'd_field_my_app.sample.type.Pong_SecondLittleId'(Rest,
							   0, 0, F1, F2, F3);
      24 ->
	  'd_field_my_app.sample.type.Pong_LongId'(Rest, 0, 0, F1,
						   F2, F3);
      _ ->
	  case Key band 7 of
	    0 ->
		'skip_varint_my_app.sample.type.Pong'(Rest, 0, 0, F1,
						      F2, F3);
	    1 ->
		'skip_64_my_app.sample.type.Pong'(Rest, 0, 0, F1, F2,
						  F3);
	    2 ->
		'skip_length_delimited_my_app.sample.type.Pong'(Rest, 0,
								0, F1, F2, F3);
	    5 ->
		'skip_32_my_app.sample.type.Pong'(Rest, 0, 0, F1, F2,
						  F3)
	  end
    end;
'dg_read_field_def_my_app.sample.type.Pong'(<<>>, 0, 0,
					    F1, F2, F3) ->
    #'my_app.sample.type.Pong'{'FirstLittleId' = F1,
			       'SecondLittleId' = F2, 'LongId' = F3}.

'd_field_my_app.sample.type.Pong_FirstLittleId'(<<1:1,
						  X:7, Rest/binary>>,
						N, Acc, F1, F2, F3)
    when N < 57 ->
    'd_field_my_app.sample.type.Pong_FirstLittleId'(Rest,
						    N + 7, X bsl N + Acc, F1,
						    F2, F3);
'd_field_my_app.sample.type.Pong_FirstLittleId'(<<0:1,
						  X:7, Rest/binary>>,
						N, Acc, _, F2, F3) ->
    <<NewFValue:32/signed-native>> = <<(X bsl N +
					  Acc):32/unsigned-native>>,
    'dfp_read_field_def_my_app.sample.type.Pong'(Rest, 0, 0,
						 NewFValue, F2, F3).


'd_field_my_app.sample.type.Pong_SecondLittleId'(<<1:1,
						   X:7, Rest/binary>>,
						 N, Acc, F1, F2, F3)
    when N < 57 ->
    'd_field_my_app.sample.type.Pong_SecondLittleId'(Rest,
						     N + 7, X bsl N + Acc, F1,
						     F2, F3);
'd_field_my_app.sample.type.Pong_SecondLittleId'(<<0:1,
						   X:7, Rest/binary>>,
						 N, Acc, F1, _, F3) ->
    <<NewFValue:32/signed-native>> = <<(X bsl N +
					  Acc):32/unsigned-native>>,
    'dfp_read_field_def_my_app.sample.type.Pong'(Rest, 0, 0,
						 F1, NewFValue, F3).


'd_field_my_app.sample.type.Pong_LongId'(<<1:1, X:7,
					   Rest/binary>>,
					 N, Acc, F1, F2, F3)
    when N < 57 ->
    'd_field_my_app.sample.type.Pong_LongId'(Rest, N + 7,
					     X bsl N + Acc, F1, F2, F3);
'd_field_my_app.sample.type.Pong_LongId'(<<0:1, X:7,
					   Rest/binary>>,
					 N, Acc, F1, F2, _) ->
    <<NewFValue:64/signed-native>> = <<(X bsl N +
					  Acc):64/unsigned-native>>,
    'dfp_read_field_def_my_app.sample.type.Pong'(Rest, 0, 0,
						 F1, F2, NewFValue).


'skip_varint_my_app.sample.type.Pong'(<<1:1, _:7,
					Rest/binary>>,
				      Z1, Z2, F1, F2, F3) ->
    'skip_varint_my_app.sample.type.Pong'(Rest, Z1, Z2, F1,
					  F2, F3);
'skip_varint_my_app.sample.type.Pong'(<<0:1, _:7,
					Rest/binary>>,
				      Z1, Z2, F1, F2, F3) ->
    'dfp_read_field_def_my_app.sample.type.Pong'(Rest, Z1,
						 Z2, F1, F2, F3).


'skip_length_delimited_my_app.sample.type.Pong'(<<1:1,
						  X:7, Rest/binary>>,
						N, Acc, F1, F2, F3)
    when N < 57 ->
    'skip_length_delimited_my_app.sample.type.Pong'(Rest,
						    N + 7, X bsl N + Acc, F1,
						    F2, F3);
'skip_length_delimited_my_app.sample.type.Pong'(<<0:1,
						  X:7, Rest/binary>>,
						N, Acc, F1, F2, F3) ->
    Length = X bsl N + Acc,
    <<_:Length/binary, Rest2/binary>> = Rest,
    'dfp_read_field_def_my_app.sample.type.Pong'(Rest2, 0,
						 0, F1, F2, F3).


'skip_32_my_app.sample.type.Pong'(<<_:32, Rest/binary>>,
				  Z1, Z2, F1, F2, F3) ->
    'dfp_read_field_def_my_app.sample.type.Pong'(Rest, Z1,
						 Z2, F1, F2, F3).


'skip_64_my_app.sample.type.Pong'(<<_:64, Rest/binary>>,
				  Z1, Z2, F1, F2, F3) ->
    'dfp_read_field_def_my_app.sample.type.Pong'(Rest, Z1,
						 Z2, F1, F2, F3).






merge_msgs(Prev, New)
    when element(1, Prev) =:= element(1, New) ->
    case Prev of
      #'my_app.sample.type.FactResp'{} ->
	  'merge_msg_my_app.sample.type.FactResp'(Prev, New);
      #'my_app.sample.type.Pong'{} ->
	  'merge_msg_my_app.sample.type.Pong'(Prev, New)
    end.

'merge_msg_my_app.sample.type.FactResp'(#'my_app.sample.type.FactResp'{resp
									   =
									   PFresp},
					#'my_app.sample.type.FactResp'{resp =
									   NFresp}) ->
    #'my_app.sample.type.FactResp'{resp =
				       if NFresp =:= undefined -> PFresp;
					  true -> NFresp
				       end}.

'merge_msg_my_app.sample.type.Pong'(#'my_app.sample.type.Pong'{'FirstLittleId'
								   =
								   PFFirstLittleId,
							       'SecondLittleId'
								   =
								   PFSecondLittleId,
							       'LongId' =
								   PFLongId},
				    #'my_app.sample.type.Pong'{'FirstLittleId' =
								   NFFirstLittleId,
							       'SecondLittleId'
								   =
								   NFSecondLittleId,
							       'LongId' =
								   NFLongId}) ->
    #'my_app.sample.type.Pong'{'FirstLittleId' =
				   if NFFirstLittleId =:= undefined ->
					  PFFirstLittleId;
				      true -> NFFirstLittleId
				   end,
			       'SecondLittleId' =
				   if NFSecondLittleId =:= undefined ->
					  PFSecondLittleId;
				      true -> NFSecondLittleId
				   end,
			       'LongId' =
				   if NFLongId =:= undefined -> PFLongId;
				      true -> NFLongId
				   end}.



verify_msg(Msg) ->
    case Msg of
      #'my_app.sample.type.FactResp'{} ->
	  'v_msg_my_app.sample.type.FactResp'(Msg,
					      ['my_app.sample.type.FactResp']);
      #'my_app.sample.type.Pong'{} ->
	  'v_msg_my_app.sample.type.Pong'(Msg,
					  ['my_app.sample.type.Pong']);
      _ -> mk_type_error(not_a_known_message, Msg, [])
    end.


'v_msg_my_app.sample.type.FactResp'(#'my_app.sample.type.FactResp'{resp
								       = F1},
				    Path) ->
    v_type_int32(F1, [resp | Path]), ok.

'v_msg_my_app.sample.type.Pong'(#'my_app.sample.type.Pong'{'FirstLittleId'
							       = F1,
							   'SecondLittleId' =
							       F2,
							   'LongId' = F3},
				Path) ->
    v_type_int32(F1, ['FirstLittleId' | Path]),
    v_type_int32(F2, ['SecondLittleId' | Path]),
    if F3 == undefined -> ok;
       true -> v_type_int64(F3, ['LongId' | Path])
    end,
    ok.

v_type_int32(N, _Path)
    when -2147483648 =< N, N =< 2147483647 ->
    ok;
v_type_int32(N, Path) when is_integer(N) ->
    mk_type_error({value_out_of_range, int32, signed, 32},
		  N, Path);
v_type_int32(X, Path) ->
    mk_type_error({bad_integer, int32, signed, 32}, X,
		  Path).

v_type_int64(N, _Path)
    when -9223372036854775808 =< N,
	 N =< 9223372036854775807 ->
    ok;
v_type_int64(N, Path) when is_integer(N) ->
    mk_type_error({value_out_of_range, int64, signed, 64},
		  N, Path);
v_type_int64(X, Path) ->
    mk_type_error({bad_integer, int64, signed, 64}, X,
		  Path).

mk_type_error(Error, ValueSeen, Path) ->
    Path2 = prettify_path(Path),
    erlang:error({gpb_type_error,
		  {Error, [{value, ValueSeen}, {path, Path2}]}}).


prettify_path([]) -> top_level;
prettify_path(PathR) ->
    list_to_atom(string:join(lists:map(fun atom_to_list/1,
				       lists:reverse(PathR)),
			     ".")).



-compile({nowarn_unused_function,id/1}).
-compile({inline,id/1}).
id(X) -> X.

-compile({nowarn_unused_function,cons/2}).
-compile({inline,cons/2}).
cons(Elem, Acc) -> [Elem | Acc].

-compile({nowarn_unused_function,lists_reverse/1}).
-compile({inline,lists_reverse/1}).
'lists_reverse'(L) -> lists:reverse(L).

-compile({nowarn_unused_function,'erlang_++'/2}).
-compile({inline,'erlang_++'/2}).
'erlang_++'(A, B) -> A ++ B.



get_msg_defs() ->
    [{{msg, 'my_app.sample.type.FactResp'},
      [#field{name = resp, fnum = 1, rnum = 2, type = int32,
	      occurrence = required, opts = []}]},
     {{msg, 'my_app.sample.type.Pong'},
      [#field{name = 'FirstLittleId', fnum = 1, rnum = 2,
	      type = int32, occurrence = required, opts = []},
       #field{name = 'SecondLittleId', fnum = 2, rnum = 3,
	      type = int32, occurrence = required, opts = []},
       #field{name = 'LongId', fnum = 3, rnum = 4,
	      type = int64, occurrence = optional, opts = []}]}].


get_msg_names() ->
    ['my_app.sample.type.FactResp',
     'my_app.sample.type.Pong'].


get_enum_names() -> [].


fetch_msg_def(MsgName) ->
    case find_msg_def(MsgName) of
      Fs when is_list(Fs) -> Fs;
      error -> erlang:error({no_such_msg, MsgName})
    end.


fetch_enum_def(EnumName) ->
    erlang:error({no_such_enum, EnumName}).


find_msg_def('my_app.sample.type.FactResp') ->
    [#field{name = resp, fnum = 1, rnum = 2, type = int32,
	    occurrence = required, opts = []}];
find_msg_def('my_app.sample.type.Pong') ->
    [#field{name = 'FirstLittleId', fnum = 1, rnum = 2,
	    type = int32, occurrence = required, opts = []},
     #field{name = 'SecondLittleId', fnum = 2, rnum = 3,
	    type = int32, occurrence = required, opts = []},
     #field{name = 'LongId', fnum = 3, rnum = 4,
	    type = int64, occurrence = optional, opts = []}];
find_msg_def(_) -> error.


find_enum_def(_) -> error.


enum_symbol_by_value(E, V) ->
    erlang:error({no_enum_defs, E, V}).


enum_value_by_symbol(E, V) ->
    erlang:error({no_enum_defs, E, V}).



get_service_names() -> [].


get_service_def(_) -> error.


get_rpc_names(_) -> error.


find_rpc_def(_, _) -> error.



fetch_rpc_def(ServiceName, RpcName) ->
    erlang:error({no_such_rpc, ServiceName, RpcName}).


get_package_name() -> 'my_app.sample.type'.



gpb_version_as_string() ->
    "3.21.0".

gpb_version_as_list() ->
    [3,21,0].
