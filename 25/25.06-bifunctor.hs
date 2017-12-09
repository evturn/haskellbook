class Bifunctor p where
  {-# MINIMAL bimap | first, second #-}
  bimap :: (a -> b) -> (c -> d) -> p a c -> p b d
  bimap f g = first f . second g

  first :: (a -> b) -> p a c -> p b c
  first f = bimap f id

  second :: (b -> c) -> p a b -> p a c
  second = bimap id

-----------------------------------------------------------------------------
-- 1.
data Deux a b = Deux a b
  deriving (Eq, Show)

instance Bifunctor Deux where
  bimap f g (Deux x y) = Deux (f x) (g y)
