import Control.Monad
import Control.Applicative
import Test.QuickCheck
import Test.QuickCheck.Classes
import Test.QuickCheck.Checkers

-- 1.
data Nope a =
  NopeDotJpg
  deriving (Eq, Show)

instance Functor Nope where
  fmap _ NopeDotJpg = NopeDotJpg

instance Applicative Nope where
  pure _ = NopeDotJpg
  _ <*> _ = NopeDotJpg

instance Monad Nope where
  return = pure
  NopeDotJpg >>= f = NopeDotJpg

instance Arbitrary a => Arbitrary (Nope a) where
  arbitrary = return NopeDotJpg

instance Eq a => EqProp (Nope a) where
  (=-=) = eq


-- 2.
data Peither e a =
    L e
  | R a
  deriving (Eq, Show)

instance Functor (Peither e) where
  fmap _ (L e)   = L e
  fmap f (R x)  = R (f x)

instance Applicative (Peither e) where
  pure = R
  R f <*> R x = R (f x)
  L e <*> _        = L e
  _ <*> L e        = L e

instance Monad (Peither e) where
  return = pure
  R x >>= f = f x
  L e >>= _ = L e

instance (Arbitrary a, Arbitrary e) => Arbitrary (Peither e a) where
  arbitrary = do
    e <- arbitrary
    x <- arbitrary
    elements [R x, L e]

instance (Eq a, Eq e) => EqProp (Peither e a) where
  (=-=) = eq

-- 3.

newtype Identity a = Identity a
  deriving (Eq, Ord, Show)

instance Functor Identity where
  fmap f (Identity x) = Identity $ f x

instance Applicative Identity where
  pure = Identity
  Identity f <*> Identity x = Identity $ f x

instance Monad Identity where
  return = pure
  Identity x >>= f = f x

instance Arbitrary a => Arbitrary (Identity a) where
  arbitrary = do
    x <- arbitrary
    return $ Identity x

instance Eq a => EqProp (Identity a) where
  (=-=) = eq


nope = NopeDotJpg :: Nope (Int, Int, Int)
peither = L "sup" :: Peither String (Int, Int, Int)
identity' = Identity $ ("dog", "cat", "surgeon") :: Identity (String, String, String)

main = do
  quickBatch $ functor $ nope
  quickBatch $ applicative $ nope
  quickBatch $ monad $ nope

  quickBatch $ functor $ peither
  quickBatch $ applicative $ peither
  quickBatch $ monad $ peither

  quickBatch $ functor $ identity'
  quickBatch $ applicative $ identity'
  quickBatch $ monad $ identity'
