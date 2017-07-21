import Control.Applicative
import Data.Monoid
import Test.QuickCheck
import Test.QuickCheck.Checkers (quickBatch, eq, (=-=), EqProp)
import Test.QuickCheck.Classes

-- 5.
data Pair a = Pair a a deriving (Eq, Show)

instance Functor Pair where
  fmap f (Pair x y) = Pair (f x) (f y)

instance Applicative Pair where
  pure x = Pair x x
  Pair f g <*> Pair x y = Pair (f x) (g y)

instance Arbitrary a => Arbitrary (Pair a) where
  arbitrary = do
    a <- arbitrary
    return $ Pair a a

instance Eq a => EqProp (Pair a) where
  (=-=) = eq

main = do
  quickBatch $ applicative $ (Pair (1, 2, "uh") (3, 4, "oh") :: Pair (Int, Int, String))
