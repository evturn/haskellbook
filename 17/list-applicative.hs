module ListApplicative where

import Control.Applicative
import Data.Monoid
import Test.QuickCheck
import Test.QuickCheck.Checkers
import Test.QuickCheck.Classes

data List a = Nil
            | Cons a (List a)
            deriving (Eq, Show)

append :: List a -> List a -> List a
append Nil ys         = ys
append (Cons x xs) ys = Cons x (append xs ys)

fold :: (a -> b -> b) -> b -> List a -> b
fold _ b Nil        = b
fold f b (Cons h t) = f h (fold f b t)

concat' :: List (List a) -> List a
concat' = fold append Nil

flatMap :: (a -> List b) -> List a -> List b
flatMap f as = concat' $ fmap f as

instance Functor List where
  fmap _ Nil         = Nil
  fmap f (Cons x xs) = Cons (f x) (fmap f xs)

instance Applicative List where
  pure x           = Cons x Nil
  _ <*> Nil        = Nil
  Nil <*> _        = Nil
  Cons f fs <*> xs = append (fmap f xs) (fs <*> xs)


take' :: Int -> List a -> List a
take' 0 _   = Nil
take' _ Nil = Nil
take' n (Cons x xs) = Cons x (take' (n - 1) xs)

newtype ZipList' a = ZipList' (List a)
                   deriving (Eq, Show)

instance Eq a => EqProp (ZipList' a) where
  xs =-= ys = xs' `eq` ys'
    where xs' = let (ZipList' l) = xs
                in take' 3000 l
          ys' = let (ZipList' l) = ys
                in take' 3000 l

instance Functor ZipList' where
  fmap f (ZipList' xs) = ZipList' $ fmap f xs

instance Applicative ZipList' where
  pure x                      = ZipList' (Cons x Nil)
  _ <*> ZipList' Nil          = ZipList' Nil
  ZipList' Nil <*> _          = ZipList' Nil
  ZipList' fs <*> ZipList' xs = ZipList' $ zip' fs xs

zip' :: List (a -> b) -> List a -> List b
zip' Nil _                   = Nil
zip' _ Nil                   = Nil
zip' (Cons f fs) (Cons x xs) = Cons (f x) (zip' fs xs)
