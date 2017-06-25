data Possibly a = LolNope
                | Yeppers a
                deriving (Eq, Show)

instance Functor Possibly where
  fmap f (Yeppers x) = Yeppers (f x)
  fmap _ LolNope     = LolNope