lefts' :: [Either a b] -> [a]
lefts' = foldr f []
  where f (Left a) xs  = a : xs
        f (Right b) xs = xs

rights' :: [Either a b] -> [b]
rights' = foldr f []
  where f (Left a) xs  = xs
        f (Right b) xs = b : xs