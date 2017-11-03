-- 1.
-- Modify the `fibs` function to only return the first 20 Fibonacci numbers.
fibs :: [Integer]
fibs = 1 : scanl (+) 1 fibs

first20Fibs :: [Integer]
first20Fibs = take 20 fibs

-- 2.
-- Modify `fibs` to return the Fibonacci numbers that are less than 100.
lessThan100Fibs :: [Integer]
lessThan100Fibs = takeWhile (<100) fibs

-- 3.
-- Write the `factorial` function as a scan.
factorial :: [Integer]
factorial = take 20 $ scanl (*) 1 [2..]
