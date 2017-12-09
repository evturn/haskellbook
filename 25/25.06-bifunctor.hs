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

-----------------------------------------------------------------------------
-- 2.
data Const a b = Const a
  deriving (Eq, Show)

instance Bifunctor Const where
  bimap f _ (Const x) = Const (f x)

-----------------------------------------------------------------------------
-- 3.
data Drei a b c = Drei a b c
  deriving (Eq, Show)

instance Bifunctor (Drei a) where
  bimap f g (Drei x y z) = Drei x (f y) (g z)

-----------------------------------------------------------------------------
-- 4.
data SuperDrei a b c = SuperDrei a b
  deriving (Eq, Show)

instance Bifunctor (SuperDrei a) where
  bimap f _ (SuperDrei x y) = SuperDrei x (f y)

-----------------------------------------------------------------------------
-- 5.
data SemiDrei a b c = SemiDrei a
  deriving (Eq, Show)

instance Bifunctor (SemiDrei a) where
  bimap _ _ (SemiDrei x) = SemiDrei x

-----------------------------------------------------------------------------
-- 6.
data Quadriceps a b c d = Quadzzz a b c d
  deriving (Eq, Show)

instance Bifunctor (Quadriceps a b) where
  bimap f g (Quadzzz w x y z) = Quadzzz w x (f y) (g z)

-----------------------------------------------------------------------------
-- 7.
data Either' a b = Left' a
                 | Right' b
                 deriving (Eq, Show)

instance Bifunctor Either' where
  bimap f _ (Left' x)  = Left' (f x)
  bimap _ g (Right' y) = Right' (g y)
