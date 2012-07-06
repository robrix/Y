#!/usr/bin/env coffee
# This is the eta-expanded call-by-value Y combinator
# Y = λf.(λx.f (λv.((x x) v))) (λx.f (λv.((x x) v)))

Z = (f) ->
	((x) ->
		(v) ->
			f(x(x))(v))
	((x) ->
		(v) ->
			f(x(x))(v))

F = (f) ->
	(n) ->
		if n == 0
			1
		else
			n * f(n - 1)

fact = Z(F)

console.log(fact(parseInt(process.argv[process.argv.length - 1] || "0")))