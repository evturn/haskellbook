{-# LANGUAGE ViewPatterns #-}

import Test.QuickCheck
import Test.QuickCheck.Function


functorCompose' :: (Eq (f c), Functor f) =>
                    f a
                 -> Fun a b
                 -> Fun b c
                 -> Bool
functorCompose' x (Fun _ f) (Fun _ g) =
  (fmap (g . f) x) == (fmap g . fmap f $ x)

newtype Identity a = Identity a

instance Functor Identity where
  fmap f (Identity a) = Identity (f a)