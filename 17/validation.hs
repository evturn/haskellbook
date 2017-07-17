module Validation where

import Control.Applicative
import Data.Monoid
import Test.QuickCheck hiding (Failure, Success)
import Test.QuickCheck.Checkers
import Test.QuickCheck.Classes

data Validation e a = Failure e
                    | Success a
                    deriving (Eq, Show)

instance Functor (Validation e) where
  fmap _ (Failure e) = Failure e
  fmap f (Success a) = Success (f a)

instance Monoid e => Applicative (Validation e) where
  pure                    = Success
  Failure a <*> Failure b = Failure (a <> b)
  Failure a <*> _         = Failure a
  _         <*> Failure a = Failure a
  Success f <*> Success a = Success (f a)

instance (Arbitrary e, Arbitrary a) => Arbitrary (Validation e a) where
  arbitrary = oneof [Success <$> arbitrary, Failure <$> arbitrary]

instance (Eq a, Eq e) => EqProp (Validation e a) where
  (=-=) = eq

main = do
  quickBatch $ applicative (Success ("this", "probably", "works") :: Validation String (String, String, String))
