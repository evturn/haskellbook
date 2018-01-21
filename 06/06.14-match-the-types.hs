import           Data.List

-- 1.
-- a)
i :: Num a => a
i = 1
-- b)
-- Replace the type signature with the following
-- `i :: a`
--
-- Answer: `a` is local to the function `i` as well as being
--         a polymorphic variable

-----------------------------------------------------------------------------
-- 2.
-- a )
f :: Float
f = 1.0
-- b)
-- Replace the type signature with the following
-- f :: Num
--
-- Answer: Num isn't providing a type variable for the value

-----------------------------------------------------------------------------
-- 3.
-- a)
f' :: Float
f' = 1.0
-- b)
-- Replace the type signature with the following
-- f' :: Fractional a => a
--
-- Answer: matches.

-----------------------------------------------------------------------------
-- 4.
-- a)
f'' :: Float
f'' = 1.0
-- b)
-- Replace the type signature with the following
-- f'' :: RealFrac a => a
--
-- Answer: matches.

-----------------------------------------------------------------------------
-- 5.
-- a)
freud :: a -> a
freud x = x
-- b)
-- Replace the type signature with the following
-- freud :: Ord a => a -> a
--
-- Answer: matches.

-----------------------------------------------------------------------------
-- 6.
-- a)
freud' :: a -> a
freud' x = x
-- b)
-- Replace the type signature with the following
-- freud' :: Int -> Int
--
-- Answer: matches.

-----------------------------------------------------------------------------
-- 7.
-- a)
myX = 1 :: Int

-- sigmund :: Int -> Int
sigmund x = myX
-- b)
-- Replace the type signature with the following
-- sigmund :: a -> a
--
-- Answer: error - `myX` is already bound to `Int`

-----------------------------------------------------------------------------
-- 8.
-- a)
myX' = 1 :: Int

sigmund' :: Int -> Int
sigmund' x = myX'
-- b)
-- Replace the type signature with the following
-- sigmund' :: Num a => a -> a
--
-- Answer: error - `myX'` is already bound to `Int`

-----------------------------------------------------------------------------
-- 9.
-- a)
jung :: Ord a => [a] -> a
jung xs = head (sort xs)
-- b)
-- Replace the type signature with the following
-- jung :: [Int] -> Int
--
-- Answer: matches.

-----------------------------------------------------------------------------
-- 10.
-- a)
young :: [Char] -> Char
young xs = head (sort xs)
-- b)
-- Replace the type signature with the following
-- young :: Ord a => [a] -> a
--
-- Answer: matches.

-----------------------------------------------------------------------------
-- 11.
-- a)
mySort :: [Char] -> [Char]
mySort = sort

-- signifier :: [Char] -> Char
signifier xs = head (mySort xs)
-- b)
-- Replace the type signature with the following
signifier :: Ord a => [a] -> a
--
-- Answer: error - `mySort` is already bound to a more specific type `[Char]`
