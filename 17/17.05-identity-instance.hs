-- Write an `Applicative` instance for `Identity`
--
-----------------------------------------------------------------------------
newtype Identity a = Identity a
  deriving (Eq, Ord, Show)

instance Functor Identity where
  fmap f (Identity x) = Identity (f x)

instance Applicative Identity where
  pure  = Identity
  Identity f <*> Identity y = Identity (f y)
