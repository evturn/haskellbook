import           Data.List       (sort)
import           Test.QuickCheck

-----------------------------------------------------------------------------
-- 1.
half :: Fractional a => a -> a
half x = x / 2

halfIdentity :: Fractional a => a -> a
halfIdentity = (*2) . half

prop_halfIdentity :: Double -> Bool
prop_halfIdentity x = halfIdentity x == x

-----------------------------------------------------------------------------
-- 2.
listOrdered :: (Ord a) => [a] -> Bool
listOrdered xs = snd $ foldr go (Nothing, True) xs
  where
    go _ status@(_, False) = status
    go y (Nothing, t)      = (Just y, t)
    go y (Just x, t)       = (Just y, x >= y)

prop_listOrdered :: String -> Bool
prop_listOrdered = listOrdered . sort

-----------------------------------------------------------------------------
-- 3.
plusAssociative :: Int -> Int -> Int -> Bool
plusAssociative x y z = x + (y + z) == (x + y) + z

plusCommutative :: Int -> Int -> Bool
plusCommutative x y = x + y == y + x

-----------------------------------------------------------------------------
-- 4.
multAssociative :: Int -> Int -> Int -> Bool
multAssociative x y z = x * (y * z) == (x * y) * z

multCommutative :: Int -> Int -> Bool
multCommutative x y = x * y == y * x

-----------------------------------------------------------------------------
-- 5.
-- | NonZero defined in Test.QuickCheck.Modifiers
prop_quotRem :: NonZero Int -> NonZero Int -> Bool
prop_quotRem (NonZero x) (NonZero y) = (quot x y) * y + (rem x y) == x

prop_divMod :: NonZero Int -> NonZero Int -> Bool
prop_divMod (NonZero x) (NonZero y) = (div x y) * y + (mod x y) == x

-----------------------------------------------------------------------------
-- 6.
expoAssociative :: Int -> Int -> Int -> Bool
expoAssociative x y z = x ^ (y ^ z) == (x ^ y) ^ z

expoCommutative :: Int -> Int -> Bool
expoCommutative x y = x ^ y == y ^ x

-----------------------------------------------------------------------------


main :: IO ()
main = do
  putStrLn "1. halfIdentity"
  quickCheck prop_halfIdentity
  putStrLn "2. listOrdered"
  quickCheck prop_listOrdered
  putStrLn "3. plusAssociative"
  quickCheck plusAssociative
  putStrLn "3. plusCommutative"
  quickCheck plusCommutative
  putStrLn "4. multAssociative"
  quickCheck multAssociative
  putStrLn "4. multCommutative"
  quickCheck multCommutative
  putStrLn "5. quotRem"
  quickCheck prop_quotRem
  putStrLn "5. divMod"
  quickCheck prop_divMod
  putStrLn "6. expoAssociative"
  quickCheck expoAssociative
  putStrLn "6. expoCommutative"
  quickCheck expoCommutative

