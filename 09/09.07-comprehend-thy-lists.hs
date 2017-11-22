mySqr :: [Integer]
mySqr = [x^2 | x <- [1..10]]

pairOfIntegers :: [(Integer, Integer)]
pairOfIntegers = [(x, y) | x <- mySqr,
                           y <- mySqr,
                           x < 50,
                           y > 50]

pairOfIntegers' :: [(Integer, Integer)]
pairOfIntegers' = take 5 [(x, y) | x <- mySqr,
                                   y <- mySqr,
                                   x < 50,
                                   y > 50]


