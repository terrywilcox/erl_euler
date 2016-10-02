-module(problem_4).

-export([declining_products/1]).

-include_lib("eunit/include/eunit.hrl").

declining_products(Start) ->
	declining_products(Start, Start, []).

declining_products(M, N, Palindromes) when N > 99 ->
	Product = M * N,
	case is_palindrome(Product) of
		true -> declining_products(M-1, M-1, [Product | Palindromes]);
		_ -> declining_products(M, N-1, Palindromes)
	end;
declining_products(M, _, Palindromes) when M > 99 ->
	declining_products(M-1 , M-1, Palindromes);
declining_products(_, _, Palindromes) ->
	[Biggest| _] = lists:reverse(lists:sort(Palindromes)),
	Biggest.
		
is_palindrome(Number) ->
	case list_to_integer(lists:reverse(integer_to_list(Number))) of
		Number -> true;
		_ -> false
	end.
	
palindrome_test_() ->
  [
    {"test", ?_assertEqual(906609, declining_products(999))}
  ].
