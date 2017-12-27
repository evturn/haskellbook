module Arith4 where

-- 1.
-- The following function returns the tens digit of an integral argument.
tensDigit :: Integral a => a -> a
tensDigit x = d
  where
    xLast = x `div` 10
    d     = xLast `mod` 10
-- a)
-- Rewrite it using `divMod`.
tensDigit' :: Integral a => a -> a
tensDigit' x = (fst . divMod x $ 10) `mod` 10

-- b)
-- Does the `divMod` version have the same type as the original version?
--
-- Answer:
-- No.

-- c)
-- Change it so that we're getting the hundreds digit instead.
hundsD :: Integral a => a -> a
hundsD x = (fst . divMod x $ 100) `mod` 10

-----------------------------------------------------------------------------
-- 2.
-- Implement the following function once each using a case expression and once
-- with a guard.
foldBool1 :: a -> a -> Bool -> a
foldBool1 x y b = case b of
  False -> x
  True  -> y


foldBool2 :: a -> a -> Bool -> a
foldBool2 x y b
    | b         = y
    | otherwise = x

-----------------------------------------------------------------------------
-- 3.
g :: (a -> b) -> (a, c) -> (b, c)
g f (x, y) = (f x, y)

-----------------------------------------------------------------------------
-- 4.
roundTrip :: (Show a, Read a) => a -> a
roundTrip a = read (show a)

main :: IO ()
main = do
  putStrLn "Composed:"
  print (roundTrip 4)
  putStrLn "Pointfree:"
  print (roundTrip' 4)
  putStrLn "Assert:"
  print ((roundTrip'' 4) :: Int)

-----------------------------------------------------------------------------
-- 5.
roundTrip' :: (Show a, Read a) => a -> a
roundTrip' = read . show

-----------------------------------------------------------------------------
-- 6.
roundTrip'' :: (Show a, Read b) => a -> b
roundTrip'' = read . show
