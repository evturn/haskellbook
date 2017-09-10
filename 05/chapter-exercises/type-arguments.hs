-- 1.
f :: a -> a -> a -> a
x :: Char
-- Answer a.
f x :: Char -> Char -> Char

-- 2.
g :: a -> b -> c -> b
-- Answer d.
g 0 'c' "woot" :: Char

-- 3.
h :: (Num a, Num b) => a -> b -> b
-- Answer d.
h 1.0 2 :: Num b => b

-- 4.
h 1 (5.5 :: Double) :: Double
-- Answer c.

-- 5.
jackal :: (Ord a, Eq b) => a -> b -> a
-- Answer a.
jackal "keyboard" "has the word jackal in it" :: [Char]

-- 6.
jackal "keyboard" :: Eq b => b -> [Char]
-- Answer e.

-- 7.
kessel :: (Ord a, Num b) => a -> b -> a
-- Answer d. 
kessel 1 2 :: (Ord a, Num a) => a
