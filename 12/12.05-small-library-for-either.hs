-- 1.
-- Try to eventually arrive at a solution that uses `foldr`, even if earlier
-- versions don't use `foldr`.
lefts' :: [Either a b] -> [a]
lefts' = foldr doIt []
  where
    doIt (Left x) y  = x : y
    doIt (Right _) y = y

-- 2.
-- Same as last one. Use `foldr` eventually.
rights' :: [Either a b] -> [b]
rights' = foldr doIt []
  where
    doIt (Right x) y = x : y
    doIt (Left _) y  = y

-- 3.
partitionEithers' :: [Either a b] -> ([a], [b])
partitionEithers' = foldr doIt ([], [])
  where
    doIt (Left l) (ls, rs)  = (l : ls, rs)
    doIt (Right r) (ls, rs) = (ls, r : rs)

-- 4.
eitherMaybe' :: (b -> c) -> Either a b -> Maybe c
eitherMaybe' _ (Left _)  = Nothing
eitherMaybe' f (Right x) = Just (f x)

-- 5.
-- Write the general catamorphism for `Either` values.
either' :: (a -> c) -> (b -> c) -> Either a b -> c
either' f _ (Left a)  = f a
either' _ g (Right b) = g b

-- 6.
-- Same as before, but use the `either'` function above.
eitherMaybe'' :: (b -> c) -> Either a b -> Maybe c
eitherMaybe'' f e = either' (\_ -> Nothing) (\x -> Just $ f x) e
