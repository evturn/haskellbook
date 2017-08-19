-- Multiple choice
--
-- 1.
-- d) may resolve to values of different types, depending on inputs

-- 2.
-- b) Char -> [String]

-- 3.
-- d) (Ord a, Num a) => a -> Bool

-- 4.
-- b) is a higher-order function

-- 5.
-- a) f True :: Bool

-- 1.
tensDigit :: Integral a => a -> a
tensDigit x = d
  where xLast = x `div` 10
        d     = xLast `mod` 10

tensDigit' :: Integral a => a -> (a, a)
tensDigit' x = x `divMod` 10

hunsD :: Integral a => a -> (a, a)
hunsD x = x `divMod` 100

-- 2.
foldBool :: a -> a -> Bool -> a
foldBool x y b =
  case b of
    True -> x
    False -> y

foldBool' :: a -> a -> Bool -> a
foldBool' x y b 
  | b         = x
  | otherwise = y
