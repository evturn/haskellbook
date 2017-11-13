import           Test.QuickCheck          hiding (Failure, Success)
import           Test.QuickCheck.Checkers
import           Test.QuickCheck.Classes

data Validation err a = Failure err
                      | Success a
                      deriving (Eq, Show)

instance Functor (Validation e) where
  fmap _ (Failure e) = Failure e
  fmap f (Success x) = Success (f x)

instance Monoid e => Applicative (Validation e) where
  pure                    = Success
  Success f <*> Success x = Success (f x)
  Success _ <*> Failure y = Failure y
  Failure x <*> Success _ = Failure x
  Failure x <*> Failure y = Failure $ x `mappend` y

instance (Arbitrary e, Arbitrary a) => Arbitrary (Validation e a) where
  arbitrary = do
    x <- arbitrary
    y <- arbitrary
    elements [ Failure x
             , Success y
             ]

instance (Eq e, Eq a) => EqProp (Validation e a) where
  (=-=) = eq

validAp :: Validation String (String, String, Int)
validAp = undefined

main :: IO ()
main = do
  quickBatch $ applicative validAp
