module LambdaTest exposing (..)

import Expect exposing (Expectation, pass)
import Fuzz exposing (Fuzzer, int, list, string)
import Lambda exposing (..)
import Test exposing (..)
import List exposing (sum, map, length)


aggregator =
    sum ... map


suite : Test
suite =
    let
        square =
            \x -> x * x
    in
        describe "combinators"
            [ describe
                "blackbird"
                [ fuzz (list (list int)) "count elements in list of lists" <|
                    \ls ->
                        aggregator length ls |> Expect.equal (sum (map length ls))
                , fuzz (list (list int)) "sum lists of lists of numbers" <|
                    \ls ->
                        aggregator sum ls |> Expect.equal (sum (map sum ls))
                ]
            , describe "map reduce"
                [ fuzz (list int) "sum of squares" <|
                    \ls ->
                        mapReduce sum square ls |> Expect.equal (sum (map square ls))
                ]
            ]
