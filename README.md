# Lambda

## About

Lambda is an Elm library of combinators!

I think combinators are to functional programming what patterns are to object
oriented programming.

Combinators are just functions that combine other functions.

For example, the map reduce pattern can be implemented as a combinator that
takes the reducer function and the mapper function. Sum of squares can then
easily be written as:

```
square x = x * x
sumOfSquares = mapReduce sum square
sumOfSquares [1, 2, 3] == 14
```

Another interesting combinator is the "blackbird":

```
blackbird f g x y = f (g x y)
```

We can use it to count the number of elements in a list of lists, for instance:

```
count ls = blackbird sum map length ls
count [[1,2], [3,4,5]] == 5
```

But we define blackbird as `...` and use currying and eta-reductions to great effect:
```
aggregator = sum ... map
count xs = aggregator length xs
count = \xs -> aggregator length xs
count = aggregator length
```

Feel free to contribute :)

## Testing

Testing is done with fuzzing, and I think they are much superior for
combinators because they will check them thoroughly.
