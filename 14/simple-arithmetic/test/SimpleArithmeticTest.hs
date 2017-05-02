module SimpleArithmeticTest where

import Data.List (sort)
import Test.QuickCheck
import SimpleArithmetic

prop_halfIdentity :: (Eq a, Fractional a) => a -> Bool
prop_halfIdentity x = halfIdentity x == x

qc_halfIdentity :: IO ()
qc_halfIdentity = do
  quickCheck (prop_halfIdentity :: Float -> Bool)

prop_listOrdered :: (Ord a) => [a] -> Bool
prop_listOrdered = listOrdered . sort

qc_listOrdered :: IO ()
qc_listOrdered = do
  quickCheck (prop_listOrdered :: [Int] -> Bool)

