{-# LANGUAGE FlexibleContexts #-}

module SkiFree where

import           Test.QuickCheck
import           Test.QuickCheck.Checkers
import           Test.QuickCheck.Classes

data S n a = S (n a) a
  deriving (Eq, Show)

instance Functor n => Functor (S n) where
  fmap f (S x y) = S (fmap f x) (f y)

instance Foldable n => Foldable (S n) where
  foldMap f (S x y) = foldMap f x `mappend` f y

instance Traversable n => Traversable (S n) where
  traverse f (S x y) = S <$> traverse f x <*> f y

instance ( Arbitrary (n a)
         , CoArbitrary (n a)
         , Arbitrary a
         , CoArbitrary a
         ) => Arbitrary (S n a) where
  arbitrary = do
    x <- arbitrary
    y <- arbitrary
    return $ S (x y) y

instance (Eq (n a), Eq a) => EqProp (S n a) where
  (=-=) = eq

sTraversable :: S [] (Int, Int, [Int])
sTraversable = undefined

main = do
  quickBatch $ functor     sTraversable
  quickBatch $ traversable sTraversable
