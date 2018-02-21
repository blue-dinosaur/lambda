module Lambda exposing (..)

{-|

    Lambda is package of functional combinators in Elm

@docs (...), mapReduce

-}

import List exposing (map)


infix 9 ...


{-| The blackbird combinator

    sum ... length = \xs -> sum (map length xs)

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
