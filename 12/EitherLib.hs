lefts' :: [Either a b] -> [a]
lefts' = foldr f []
  where
    f (Left a) xs  = a : xs
    f (Right b) xs = xs

rights' :: [Either a b] -> [b]
rights' = foldr f []
  where
    f (Left a) xs  = xs
    f (Right b) xs = b : xs

partitionEithers' :: [Either a b ] -> ([a], [b])
partitionEithers' = foldr f ([], [])
  where
    f (Left a) (xs, ys)  = (a:xs, ys)
    f (Right b) (xs, ys) = (xs, b:ys)

eitherMaybe' :: (b -> c) -> Either a b -> Maybe c
eitherMaybe' _ (Left _)  = Nothing
eitherMaybe' f (Right b) = Just (f b)