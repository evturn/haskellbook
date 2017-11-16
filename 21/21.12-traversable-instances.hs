import           Test.QuickCheck
import           Test.QuickCheck.Checkers
import           Test.QuickCheck.Classes

type IIIs = (Int, Int, [Int])

-----------------------------------------------------------------------------
-- Identity
--
newtype Identity a = Identity a
  deriving (Eq, Ord, Show)

instance Functor Identity where
  fmap f (Identity x) = Identity (f x)

instance Foldable Identity where
  foldr f z (Identity y) = f y z

instance Traversable Identity where
  traverse f (Identity x) = Identity <$> f x

instance Arbitrary a => Arbitrary (Identity a) where
  arbitrary = do
    x <- arbitrary
    return $ Identity x

instance Eq a => EqProp (Identity a) where
  (=-=) = eq

identityTraversable :: Identity IIIs
identityTraversable = undefined


main :: IO ()
main = do
  quickBatch $ traversable identityTraversable
