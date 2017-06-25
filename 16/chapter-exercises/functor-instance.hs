{-# LANGUAGE FlexibleInstances #-}

-- 1.
data Quant a b = Finance
               | Desk a
               | Bloor b
               deriving (Eq, Show)

instance Functor (Quant a) where
  fmap _ Finance   = Finance
  fmap _ (Desk x)  = Desk x
  fmap f (Bloor y) = Bloor (f y)

-- 2.
data K a b = K a deriving (Eq, Show)

instance Functor (K a) where
  fmap _ (K a) = K a

-- 3.
newtype Flip f a b = Flip (f b a) deriving (Eq, Show)

newtype Functor (Flip K a) where
  fmap f (Flip (K x)) = Flip $ K $ f x