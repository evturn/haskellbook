import Data.Traversable
import Test.QuickCheck (Arbitrary, arbitrary)
import Test.QuickCheck.Classes
import Test.QuickCheck.Checkers


type TupleOfStuff = (Int, Int, [Int])


newtype Identity a = Identity a
  deriving (Eq, Ord, Show)

instance Functor Identity where
  fmap f (Identity x) = Identity (f x)

instance Foldable Identity where
  foldr f x (Identity xs) = f xs x

instance Traversable Identity where
  traverse f (Identity x) = Identity <$> f x 

instance Arbitrary a => Arbitrary (Identity a) where
  arbitrary = do
    x <- arbitrary
    return $ Identity x

instance Eq a => EqProp (Identity a) where
  (=-=) = eq


idTrigger = undefined :: Identity TupleOfStuff 

main = do
  putStrLn "\nIdentity"
  quickBatch (traversable idTrigger)
