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

genBool :: Gen Bool
genBool = choose (False, True)

genBool' :: Gen Bool
genBool' = elements [False, True]

genOrdering :: Gen Ordering
genOrdering = elements [LT, EQ, GT]

genChar :: Gen Char
genChar = elements ['a'..'z']

genTuple :: (Arbitrary a, Arbitrary b) => Gen (a, b)
genTuple = do
  a <- arbitrary
  b <- arbitrary
  return (a, b)

genThreeple :: (Arbitrary a, Arbitrary b, Arbitrary c) => Gen (a, b, c)
genThreeple = do
  a <- arbitrary
  b <- arbitrary
  c <- arbitrary
  return (a, b, c)

genEither :: (Arbitrary a, Arbitrary b) => Gen (Either a b)
genEither = do
  a <- arbitrary
  b <- arbitrary
  elements [ Left a
           , Right b
           ]

genMaybe :: Arbitrary a => Gen (Maybe a)
genMaybe = do
  a <- arbitrary
  elements [ Nothing
           , Just a
           ]

genMaybe' :: Arbitrary a => Gen (Maybe a)
genMaybe' = do
  a <- arbitrary
  frequency [ (1, return Nothing)
            , (3, return $ Just a)
            ]

prop_additionGreater :: Int -> Bool
prop_additionGreater x = x + 1 > x

runQc :: IO ()
runQc = quickCheck prop_additionGreater

main :: IO ()
main = hspec $ do
  describe "Addition" $ do
    it "1 + 1 is greater than 1" $ do
      ((1 + 1) :: Integer) > (1 :: Integer) `shouldBe` True

    it "x + 1 is always greater than x" $ do
      property $ \x -> x + 1 > (x :: Int)

  describe "Division" $ do
    it "15 divided by 3 is 5" $ do
      dividedBy (15 :: Integer) (3 :: Integer) `shouldBe` (5, 0)

    it "22 divided by 5 is 4 remainer 2" $ do
      dividedBy (22 :: Integer) (5 :: Integer) `shouldBe` (4, 2)

  describe "Multiplication" $ do
    it "2 multiplied by 10 using recursive summation is 20" $ do
      mult (2 :: Integer) (10 :: Integer) `shouldBe` 20
