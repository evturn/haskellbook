import Data.Monoid
import Data.Foldable

-- 1.
data Constant a b =
  Constant a
  deriving (Eq, Show)

instance Foldable (Constant a) where
  foldMap f (Constant x) = mempty

-- 2.
data Two a b =
  Two a b

instance Foldable (Two a) where
  foldMap f (Two x y) = f y

-- 3.
data Three a b c =
  Three a b c

instance Foldable (Three a b) where
  foldMap f (Three x y z) = f z

-- 4.
data Three' a b =
  Three' a b b

instance Foldable (Three' a) where
  foldMap f (Three' x y y') = (f y) <> (f y')

-- 5.
data Four' a b =
  Four' a b b b

instance Foldable (Four' a) where
  foldMap f (Four' x y y' y'') = (f y) <> (f y') <> (f y'')
