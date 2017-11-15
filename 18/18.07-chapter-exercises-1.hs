import           Test.QuickCheck
import           Test.QuickCheck.Checkers
import           Test.QuickCheck.Classes

type SSI = (String, String, Int)

-----------------------------------------------------------------------------
-- 1.
data Nope a = NopeDotJpg
  deriving (Eq, Show)

instance Functor Nope where
  fmap _ _ = NopeDotJpg

instance Applicative Nope where
  pure _  = NopeDotJpg
  _ <*> _ = NopeDotJpg

instance Monad Nope where
  return  = pure
  _ >>= _ = NopeDotJpg

instance Arbitrary a => Arbitrary (Nope a) where
  arbitrary = return NopeDotJpg

instance Eq a => EqProp (Nope a) where
  (=-=) = eq

nope = undefined :: Nope SSI

main :: IO ()
main = do
  quickBatch $ functor     nope
  quickBatch $ applicative nope
  quickBatch $ monad       nope
