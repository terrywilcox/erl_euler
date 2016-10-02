-module(problem_2).

-export([]).

-include_lib("eunit/include/eunit.hrl").

erl_sum(X1, X2, Sum) when (X1 + X2) > 4000000 ->
	Sum;
erl_sum(X1, X2, Sum) when (X1 + X2) rem 2 =:= 0 ->
	erl_sum(X2, X1 + X2, Sum + X1 + X2);
erl_sum(X1, X2, Sum) ->
	erl_sum(X2, X1 + X2, Sum).
	
	
erl_sum_test_() ->
  [
    {"test", ?_assertEqual(4613732, erl_sum(1, 2, 2))}
  ].
