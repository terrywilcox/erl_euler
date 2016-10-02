-module(problem_5).

-export([find_multiples/0, is_multiple_of_all/2]).

-include_lib("eunit/include/eunit.hrl").

find_multiples() ->
	NonPrimes = [20, 18, 16, 15, 14, 12],
	BaseProduct = lists:foldl(fun(X, Prod) -> X * Prod end, 1, [2, 3, 5, 7, 11, 13, 17, 19]),
	find_multiples(BaseProduct, NonPrimes, 1).
	
find_multiples(BaseProduct, NonPrimes, X) ->
	Mult = BaseProduct * X,
	case is_multiple_of_all(Mult, NonPrimes) of
		0 -> Mult;
		_ -> find_multiples(BaseProduct, NonPrimes, X + 1)
	end.

is_multiple_of_all(Mult, NonPrimes) ->
	Remainders = lists:map(fun(X) -> Mult rem X end, NonPrimes),
	lists:sum(Remainders).
	
find_multiples_test_() ->
  [
    {"test", ?_assertEqual(232792560, find_multiples())}
  ].
