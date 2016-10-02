-module(problem_1).

-export([solve/2]).

-include_lib("eunit/include/eunit.hrl").

solve(Min, Max) ->
	lists:sum([X || X <- lists:seq(Min, Max), X rem 3 =:= 0 orelse X rem 5 =:= 0]).

solve_test_() ->
  [
    {"1 to 9", ?_assertEqual(23, solve(1, 9))},
    {"1 to 999", ?_assertEqual(233168, solve(1, 999))}
  ].