-- A common Haskell idiom called a `go` function defines a function via a `where`-clause
-- It can accept more arguments than the top-level function `dividedBy'` does.

-- The top-level function, `dividedBy'` takes two arguments, `numerator` and `denominator`
-- But a third argument is needed in order to keep track of how many times we do the subtraction.

-- That argument is called `count` and is defined starting at 0
-- Then incremented by 1 every time the `otherwise` case is invoked.

-- The `go` function has two branches.
-- When the `numerator` is less than `denominator` recursion stops.
-- The result is a tuple of `count` and the last value for `n`.

-- The result from `count` is the quotient
-- The second value in the tuple would be the remainder.