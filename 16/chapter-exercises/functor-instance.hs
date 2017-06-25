-- 1.
data Quant a b = Finance
               | Desk a
               | Bloor b
               deriving (Eq, Show)

instance Functor (Quant a) where
  fmap _ Finance   = Finance
  fmap _ (Desk x)  = Desk x
  fmap f (Bloor y) = Bloor (f y)