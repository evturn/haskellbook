import Control.Applicative
import Control.Monad

data Sum a b =
    First a
  | Second b
  deriving (Eq, Show)

instance Functor (Sum a) where
  fmap _ (First e)  = First e
  fmap f (Second x) = Second (f x)

instance Applicative (Sum a) where
  pure                  = Second
  First e  <*> _        = First e
  _        <*> First e  = First e
  Second f <*> Second x = Second (f x)

instance Monad (Sum a) where
  return = pure
  First e  >>= _ = First e
  Second x >>= f = f x
