mc91 :: (Ord a, Num a) => a -> a
mc91 x = go x
  where go x
         | x > 100   = x - 10
         | otherwise = 91