-- 1.
i :: a -> a
i = id

-- 2.
c :: a -> b -> a
c x y = x

-- 3.
c'' :: b -> a -> b
c'' = c

-- 4.
c' :: a -> b -> b
c' x y = y

-- 5.
r :: [a] -> [a]
r xs = reverse xs
-- or
-- r xs = id xs

-- 6.
co :: (b -> c) -> (a -> b) -> a -> c
co f g x = f . g $ x

-- 7.
a :: (a -> c) -> a -> a
a f x = x

-- 8.
a' :: (a -> b) -> a -> b
a' f x = f x 

