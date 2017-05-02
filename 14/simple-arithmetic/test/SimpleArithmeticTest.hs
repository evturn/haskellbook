module SimpleArithmeticTest where

import Test.QuickCheck
import SimpleArithmetic

prop_halfIdentity :: (Eq a, Fractional a) => a -> Bool
prop_halfIdentity x = halfIdentity x == x

main :: IO ()
main = do
  quickCheck (prop_halfIdentity :: Float -> Bool)