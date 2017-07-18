-- 1.
-- []

pure :: a -> [a]
(<*>) :: [(a -> b)] -> [a] -> [b]

-- 2,
-- IO

pure :: a -> IO a
(<*>) :: IO (a -> b) -> IO a -> IO b

-- 3.
-- (,) a

pure :: Monoid a => b -> (a, b)
(<*>) :: Monoid c => (c, a -> b) -> (c, a) -> (c, b)
