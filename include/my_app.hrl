%% -*- mode:erlang -*-

-ifndef(HEADER_MY_APP).
-define(HEADER_MY_APP, true).

-define(RAND_RANGE(From, To), my_app_utils:get_rand_range(From, To)).
-define(RAND_DEC(ByteSize), my_app_utils:get_rand_dec(ByteSize)).
-define(RAND_HEX(ByteSize), my_app_utils:get_rand_hex(ByteSize)).
-define(RAND_STR(Size), my_app_utils:get_rand_str(Size)).
-define(RAND_BIN(Size), my_app_utils:get_rand_bin(Size)).
-define(UUID(), my_app_utils:get_uuid()).


-define(NOW_SEC(), erlang:system_time(seconds)).
-define(NOW_MILLI(), erlang:system_time(milli_seconds)).
-define(NOW_MICRO(), erlang:system_time()).
-define(NOW_NANO(), erlang:system_time(nano_seconds)).
-define(NOW(), erlang:system_time()).

-ifdef(TEST).
-define(LOG_ERROR(Format, Args), ct:print(default, 50, Format, Args)).
-define(LOG_INFO(Format, Args), ?LOG_ERROR(Format, Args)).
-define(LOG_DEBUG(Format, Args), ?LOG_ERROR(Format, Args)).
-else.
-define(LOG_ERROR(Format, Args), lager:error(Format, Args)).
-define(LOG_INFO(Format, Args), lager:info(Format, Args)).
-define(LOG_DEBUG(Format, Args), lager:debug(Format, Args)).
-endif.

-endif.
