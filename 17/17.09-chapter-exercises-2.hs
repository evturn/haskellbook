import           Data.Monoid              (Monoid, (<>))
import           Test.QuickCheck
import           Test.QuickCheck.Checkers
import           Test.QuickCheck.Classes

type SSI = (String, String, Int)

-----------------------------------------------------------------------------
-- 1.
data Pair a = Pair a a
  deriving (Eq, Show)

instance Functor Pair where
  fmap f (Pair x x') = Pair (f x) (f x')

instance Applicative Pair where
  pure x = Pair x x
  Pair f f' <*> Pair x x' = Pair (f x) (f' x')

instance Arbitrary a => Arbitrary (Pair a) where
  arbitrary = do
    x <- arbitrary
    return $ Pair x x

instance Eq a => EqProp (Pair a) where
  (=-=) = eq

pair = undefined :: Pair SSI

-----------------------------------------------------------------------------
-- 2.
data Two a b = Two a b
  deriving (Eq, Show)

instance Functor (Two a) where
  fmap f (Two x y) = Two x (f y)

instance Monoid a => Applicative (Two a) where
  pure x               = Two mempty x
  Two x f <*> Two x' y = Two (x <> x') (f y)

instance (Arbitrary a, Arbitrary b) => Arbitrary (Two a b) where
  arbitrary = do
    x <- arbitrary
    y <- arbitrary
    return $ Two x y

instance (Eq a, Eq b) => EqProp (Two a b) where
  (=-=) = eq

two = undefined :: Two String SSI

-----------------------------------------------------------------------------
-- 3.
data Three a b c = Three a b c
  deriving (Eq, Show)

instance Functor (Three a b) where
  fmap f (Three x y z) = Three x y (f z)

instance (Monoid a, Monoid b) => Applicative (Three a b) where
  pure x                        = Three mempty mempty x
  Three x y f <*> Three x' y' z = Three (x <> x') (y <> y') (f z)

instance ( Arbitrary a
         , Arbitrary b
         , Arbitrary c
         ) => Arbitrary (Three a b c) where
  arbitrary = do
    x <- arbitrary
    y <- arbitrary
    z <- arbitrary
    return $ Three x y z

instance (Eq a, Eq b, Eq c) => EqProp (Three a b c) where
  (=-=) = eq

three = undefined :: Three String String SSI

-----------------------------------------------------------------------------
-- 4.
data Three' a b = Three' a b b
  deriving (Eq, Show)

instance Functor (Three' a) where
  fmap f (Three' x y y') = Three' x (f y) (f y')

instance Monoid a => Applicative (Three' a) where
  pure x                           = Three' mempty x x
  Three' x f f' <*> Three' x' y y' = Three' (x <> x') (f y) (f' y')

instance (Arbitrary a, Arbitrary b) => Arbitrary (Three' a b) where
  arbitrary = do
    x <- arbitrary
    y <- arbitrary
    return $ Three' x y y

instance (Eq a, Eq b) => EqProp (Three' a b) where
  (=-=) = eq

three' = undefined :: Three' String SSI

-----------------------------------------------------------------------------
-- 5.
data Four a b c d = Four a b c d
  deriving (Eq, Show)

instance Functor (Four a b c) where
  fmap f (Four w x y z) = Four w x y (f z)

instance (Monoid a, Monoid b, Monoid c) => Applicative (Four a b c) where
  pure x                           = Four mempty mempty mempty x
  Four x y z f <*> Four x' y' z' w = Four (x <> x') (y <> y') (z <> z') (f w)

instance ( Arbitrary a
         , Arbitrary b
         , Arbitrary c
         , Arbitrary d
         ) => Arbitrary (Four a b c d) where
  arbitrary = do
    w <- arbitrary
    x <- arbitrary
    y <- arbitrary
    z <- arbitrary
    return $ Four w x y z

instance (Eq a, Eq b, Eq c, Eq d) => EqProp (Four a b c d) where
  (=-=) = eq

four = undefined :: Four String String String SSI

-----------------------------------------------------------------------------
main :: IO ()
main = do
  putStrLn "\n1. Pair"
  quickBatch $ functor     pair
  quickBatch $ applicative pair
  putStrLn "\n2. Two"
  quickBatch $ functor     two
  quickBatch $ applicative two
  putStrLn "\n3. Three"
  quickBatch $ functor     three
  quickBatch $ applicative three
  putStrLn "\n4. Three'"
  quickBatch $ functor     three'
  quickBatch $ applicative three'
  putStrLn "\n5. Four"
  quickBatch $ functor     four
  quickBatch $ applicative four
