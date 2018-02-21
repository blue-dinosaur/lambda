module Lambda exposing (..)

{-|

    Lambda is package of functional combinators in Elm

@docs (...), mapReduce

-}

import List exposing (map)


infix 9 ...


{-| The blackbird combinator

    The use of this combinator is to build higher functions.

    Example:

    (sum ... map) length xs == sum (map length xs)

    We can abstract is as:

    aggregate f xs = sum ... map f xs
    aggregate f = \xs -> sum map f xs
    aggregate = \f -> \xs -> sum map f xs
    aggregate = sum map f xs

    And we can count the number of elements in a list of lists with:

    aggregate length

-}
(...) : (a -> b) -> (c -> d -> a) -> (c -> d -> b)
(...) f g =
    \x ->
        \y ->
            f (g x y)


{-| Simple map reduce

    mapReduce sum (\x -> x * x) = sum (map (\x -> x * x) ys)

-}
mapReduce : (List b -> c) -> (a -> b) -> (List a -> c)
mapReduce f g =
    f << map g
