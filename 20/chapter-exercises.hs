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
