-- 1.
-- Write a function `myIterate` using direct recursion.
myIterate :: (a -> a) -> a -> [a]
myIterate f x = x : myIterate f (f x)

-- 2.
-- Write a function `myUnfoldr` using direct recursion.
myUnfoldr :: (b -> Maybe (a, b)) -> b -> [a]
myUnfoldr = undefined

-- 3.
-- Rewrite `myIterate` into `betterIterate` using `myUnfoldr`.
betterIterate :: (a -> a) -> a -> [a]
betterIterate = undefined
