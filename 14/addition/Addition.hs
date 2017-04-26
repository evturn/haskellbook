module Addition where

import Test.Hspec
import Test.QuickCheck

main :: IO ()
main = hspec $ do
  describe "Addition" $ do
    it "15 divided by 3 is 5" $ do
      dividedBy 15 3 `shouldBe` (5, 0)
    it "22 divided by 5 is 4 remainder 2" $ do
      dividedBy 22 5 `shouldBe` (4, 2)
    it "2 multiplied by 20 is 40" $ do
      multiplyWithAddition 2 20 `shouldBe` 40
    it "x + 1 is always greater than x" $ do
      property $ \x -> x + 1 > (x :: Int)

dividedBy :: Integral a => a -> a -> (a, a)
dividedBy num denom = go num denom 0
  where go n   d count
         | n < d = (count, n)
         | otherwise = go (n - d) d (count + 1)

multiplyWithAddition :: (Eq a, Num a) => a -> a -> a
multiplyWithAddition x y = go x y 0
    where go a b acc
            | b == 0 = acc
            | otherwise = go a (b - 1) (acc + a)

sayHello :: IO ()
sayHello = putStrLn "No."