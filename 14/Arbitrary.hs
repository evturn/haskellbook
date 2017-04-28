module Main where

import Test.QuickCheck
import Test.QuickCheck.Gen (oneof)

data Trivial = Trivial
               deriving (Eq, Show)

data Identity a = Identity a
                  deriving (Eq, Show)

data Pair a b = Pair a b
                deriving (Eq, Show)

data Sum a b = First a | Second b
               deriving (Eq, Show)

trivialGen :: Gen Trivial
trivialGen = return Trivial -- `return` is necessary to return `Trivial` in the `Gen` monad.

instance Arbitrary Trivial where
  arbitrary = trivialGen


identityGen :: Arbitrary a => Gen (Identity a)
identityGen = do
  a <- arbitrary
  return (Identity a)

instance Arbitrary a =>
         Arbitrary (Identity a) where
  arbitrary = identityGen

identityGenInt :: Gen (Identity Int)
identityGenInt = identityGen


pairGen :: (Arbitrary a, Arbitrary b) => Gen (Pair a b)
pairGen = do
  a <- arbitrary
  b <- arbitrary
  return (Pair a b)

instance (Arbitrary a, Arbitrary b) =>
          Arbitrary (Pair a b) where
  arbitrary = pairGen

pairGenIntString :: Gen (Pair Int String)
pairGenIntString = pairGen


sumGenEqual :: (Arbitrary a, Arbitrary b) => Gen (Sum a b)
sumGenEqual = do
  a <- arbitrary
  b <- arbitrary
  oneof  [return $ First a,
          return $ Second b]

sumGenCharInt :: Gen (Sum Char Int)
sumGenCharInt = sumGenEqual

main :: IO ()
main = do
  sample trivialGen