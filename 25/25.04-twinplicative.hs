{-# LANGUAGE InstanceSigs #-}

import           Control.Applicative

newtype Compose f g a = Compose
    { getCompose :: f (g a)
    } deriving (Eq, Show)

instance (Functor f, Functor g) => Functor (Compose f g) where
  fmap f (Compose x) = Compose $ (fmap . fmap) f x

instance (Applicative f, Applicative g) => Applicative (Compose f g) where
  pure :: a -> Compose f g a
  pure x = Compose $ (pure . pure) x

  (<*>) :: Compose f g (a -> b) -> Compose f g a -> Compose f g b
  Compose f <*> Compose x = Compose (liftA2 (<*>) f x)
