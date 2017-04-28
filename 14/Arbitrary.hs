module Main where

import Test.QuickCheck

data Trivial = Trivial
               deriving (Eq, Show)

data Identity a = Identity a
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

main :: IO ()
main = do
  sample trivialGen