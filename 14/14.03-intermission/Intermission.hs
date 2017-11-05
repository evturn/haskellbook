module Intermission where

import           Test.Hspec

mult :: (Eq a, Ord a, Num a) => a -> a -> a
mult x y
    | x > 0     = y + mult (x - 1) y
    | x < 0     = (negate y) + mult (x + 1) y
    | otherwise = 0

main :: IO ()
main = hspec $ do
  describe "Intermission" $ do
    it "2 multiplied by 10 using recursive summation is 20" $ do
      mult 2 10 `shouldBe` 20

