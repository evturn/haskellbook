import Control.Applicative
import Data.Monoid (Monoid, (<>))
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

-- 6.
data Two a b = Two a b deriving (Eq, Show)

instance Functor (Two a) where
  fmap f (Two x y) = Two x (f y)

instance Monoid a => Applicative (Two a) where
  pure = Two mempty
  Two a f <*> Two a' x = Two (a <> a') (f x)

instance (Arbitrary a, Arbitrary b) => Arbitrary (Two a b) where
  arbitrary = do
    x <- arbitrary
    y <- arbitrary
    return (Two x y)

instance (Eq a, Eq b) => EqProp (Two a b) where
  (=-=) = eq

-- 7.
data Three a b c = Three a b c deriving (Eq, Show)

instance Functor (Three a b) where
  fmap f (Three x y z) = Three x y (f z)

instance (Monoid a, Monoid b) => Applicative (Three a b) where
  pure = Three mempty mempty
  Three a b f <*> Three x y z = Three (a <> x) (b <> y) (f z)

instance (Arbitrary a, Arbitrary b, Arbitrary c) => Arbitrary (Three a b c) where
  arbitrary = do
    x <- arbitrary
    y <- arbitrary
    z <- arbitrary
    return (Three x y z)

instance (Eq a, Eq b, Eq c) => EqProp (Three a b c) where
  (=-=) = eq

-- 8.
data Three' a b = Three' a b b deriving (Eq, Show)

instance Functor (Three' a) where
  fmap f (Three' x y z) = Three' x (f y) (f z)

instance Monoid a => Applicative (Three' a) where
  pure x = Three' mempty x x
  Three' a f g <*> Three' x y z = Three' (a <> x) (f y) (g z)

instance (Arbitrary a, Arbitrary b) => Arbitrary (Three' a b) where
  arbitrary = do
    x <- arbitrary
    y <- arbitrary
    return (Three' x y y)

instance (Eq a, Eq b) => EqProp (Three' a b) where
  (=-=) = eq

main = do
  quickBatch $ applicative $ (Pair (1, 2, "uh") (3, 4, "oh") :: Pair (Int, Int, String))
  quickBatch $ applicative (Two ("sure", "dude") ("cool", "man", "why do I need a third one here?"))
  quickBatch $ applicative (Three ("one", "more", "guess") ("on", "how", "to") ("make", "this", "work"))
  quickBatch $ applicative (Three' ("please", "work", "and") ("don't", "break", "while") ("this", "tries", "compiling"))
