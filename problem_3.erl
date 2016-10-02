-module(problem_3).

-export([factorize/1]).

-include_lib("eunit/include/eunit.hrl").

factorize(Number) ->
	factorize(Number, 2).

factorize(1, Factor) ->
	Factor - 1;
factorize(Number, Factor) ->
	factorize(reduce(Number, Factor), Factor + 1).
		
reduce(N, M) ->
	case N rem M of
		0 -> reduce(trunc(N/M), M);
		_ -> N
	end.
	
factorize_test_() ->
  [
    {"test", ?_assertEqual(6857, factorize(600851475143))}
  ].
