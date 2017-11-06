module Addition where

import           Test.Hspec
import           Test.QuickCheck

dividedBy :: Integral a => a -> a -> (a, a)
dividedBy num denom = go num denom 0
  where
    go n d count
      | n < d     = (count, n)
      | otherwise = go (n -d) d (count + 1)

mult :: (Eq a, Ord a, Num a) => a -> a -> a
mult x y
    | x > 0     = y + mult (x - 1) y
    | x < 0     = (negate y) + mult (x + 1) y
    | otherwise = 0

main :: IO ()
main = hspec $ do
  describe "Addition" $ do
    it "1 + 1 is greater than 1" $ do
      (1 + 1) > 1 `shouldBe` True
    it "x + 1 is always greater than x" $ do
      property $ \x -> x + 1 > (x :: Int)
  describe "Division" $ do
    it "15 divided by 3 is 5" $ do
      dividedBy 15 3 `shouldBe` (5, 0)
    it "22 divided by 5 is 4 remainer 2" $ do
      dividedBy 22 5 `shouldBe` (4, 2)
  describe "Multiplication" $ do
    it "2 multiplied by 10 using recursive summation is 20" $ do
      mult 2 10 `shouldBe` 20

