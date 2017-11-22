mySqr :: [Integer]
mySqr = [x^2 | x <- [1..5]]

myCube :: [Integer]
myCube = [y^3 | y <- [1..5]]

-----------------------------------------------------------------------------
-- 1.
sqrCubePairs :: [(Integer, Integer)]
sqrCubePairs = [(x, y) | x <- mySqr, y <- myCube]

-----------------------------------------------------------------------------
-- 2.
sqrCubePairs' :: [(Integer, Integer)]
sqrCubePairs' = [(x, y) | x <- mySqr, y <- myCube, x < 50, y < 50]

-----------------------------------------------------------------------------
-- 3.
sqrCubePairsLength :: Int
sqrCubePairsLength = length sqrCubePairs'

