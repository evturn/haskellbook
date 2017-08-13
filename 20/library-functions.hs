-- 1.
sum' :: (Folable t, Num a) => t a -> a
sum' = foldMap Sum

-- 2.
product' :: (Foldable t, Num a) => t a -> a
product' = foldMap Product

-- 3.
elem' :: (Foldable t, Eq a) => t a -> Bool
elem' n xs = foldMap Any $ fmap (== n) xs
