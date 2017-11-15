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

-----------------------------------------------------------------------------
-- 2.
data PhhhbbtttEither b a = Left' a
                         | Right' b
                         deriving (Eq, Show)

instance Functor (PhhhbbtttEither b) where
  fmap f (Left' x)  = Left' (f x)
  fmap _ (Right' x) = Right' x

instance Applicative (PhhhbbtttEither b) where
  pure = Left'
  Left' f  <*> Left' y  = Left' (f y)
  Right' x <*> _        = Right' x
  _        <*> Right' y = Right' y

instance Monad (PhhhbbtttEither b) where
  return = pure
  Left' x  >>= f = f x
  Right' x >>= _ = Right' x

instance (Arbitrary b, Arbitrary a) => Arbitrary (PhhhbbtttEither b a) where
  arbitrary = do
    x <- arbitrary
    y <- arbitrary
    elements [ Left' y
             , Right' x
             ]

instance (Eq b, Eq a) => EqProp (PhhhbbtttEither b a) where
  (=-=) = eq

peither = undefined :: PhhhbbtttEither String SSI

-----------------------------------------------------------------------------
-- 3.
newtype Identity a = Identity a
  deriving (Eq, Ord, Show)

instance Functor Identity where
  fmap f (Identity x) = Identity (f x)

instance Applicative Identity where
  pure = Identity
  Identity f <*> Identity x = Identity (f x)

instance Monad Identity where
  return = pure
  Identity x >>= f = f x

instance Arbitrary a => Arbitrary (Identity a) where
  arbitrary = do
    x <- arbitrary
    return $ Identity x

instance Eq a => EqProp (Identity a) where
  (=-=) = eq

identity = undefined :: Identity SSI

main :: IO ()
main = do
  putStrLn "\n1. Nope"
  quickBatch $ functor     nope
  quickBatch $ applicative nope
  quickBatch $ monad       nope
  putStrLn "\n2. PhhhbbtttEither"
  quickBatch $ functor     peither
  quickBatch $ applicative peither
  quickBatch $ monad       peither
  putStrLn "\n3. Identity"
  quickBatch $ functor     identity
  quickBatch $ applicative identity
  quickBatch $ monad       identity
