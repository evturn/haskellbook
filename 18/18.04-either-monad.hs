data Sum a b = First a
             | Second b
             deriving (Eq, Show)

instance Functor (Sum a) where
  fmap _ (First x)  = First x
  fmap f (Second x) = Second (f x)

instance Applicative (Sum a) where
  pure                  = Second
  First  x <*> _        = First x
  _        <*> First x  = First x
  Second f <*> Second x = Second (f x)

instance Monad (Sum a) where
  return         = pure
  First  x >>= _ = First x
  Second x >>= f = f x
