data DividedResult = Result Integer
                   | DividedByZero
                   deriving Show

dividedBy :: Integral a => a -> a -> DividedResult
dividedBy num denom = go num denom 0
  where
    go n d count
      | d == 0    = DividedByZero
      | n < d     = Result count
      | otherwise = go (n - d) d (count + 1)
