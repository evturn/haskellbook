-- 1.
-- Write `unfold` for `BinaryTree`.
data BinaryTree a = Leaf
                  | Node (BinaryTree a) a (BinaryTree a)
                  deriving (Eq, Ord, Show)

-- myUnfoldr :: (b -> Maybe (a, b)) -> b -> [a]
-- myUnfoldr f x = doIt (f x)
--   where
--     doIt Nothing       = []
--     doIt (Just (x, y)) = x : myUnfoldr f y

unfold :: (a -> Maybe (a, b, a)) -> a -> BinaryTree b
unfold f x = doIt (f x)
  where
    doIt Nothing           = Leaf
    doIt (Just (x, y, x')) = Node (unfold f x) y (unfold f x')

-- 2.
-- Using the `unfold` function, write the following:
treeBuild :: Integer -> BinaryTree Integer
treeBuild n = unfold build 0
  where
    build a 
        | a < n     = Just (a + 1, a, a + 1)
        | otherwise = Nothing
