-- Exercises: Lookups

-- 1.
-- added = (+3) (lookup 3 $ zip [1, 2, 3] [4, 5, 6])

added :: Maybe Integer
added = (+3) <$> (lookup 3 $ zip [1, 2, 3] [4, 5, 6])
