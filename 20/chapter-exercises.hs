import Data.Monoid
import Data.Foldable

-- 1.
data Constant a b =
  Constant a
  deriving (Eq, Show)

instance Foldable (Constant a) where
  foldMap f (Constant x) = mempty
