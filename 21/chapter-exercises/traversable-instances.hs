import Data.Traversable
import Test.QuickCheck (Arbitrary, arbitrary)
import Test.QuickCheck.Classes
import Test.QuickCheck.Checkers

-----------------------------------------------------------------------------
--
-- Identity
--
-----------------------------------------------------------------------------

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

-----------------------------------------------------------------------------
--
-- Constant
--
-----------------------------------------------------------------------------
newtype Constant a b =
  Constant { getConstant :: a } deriving (Eq, Show, Ord)

instance Functor (Constant a) where
  fmap _ (Constant x) = Constant x

instance Foldable (Constant a) where
  foldr _ x (Constant _) = x

instance Traversable (Constant a) where
  traverse f (Constant x) = pure $ Constant x 

instance Arbitrary a => Arbitrary (Constant a b) where
  arbitrary = do
    x <- arbitrary
    return $ Constant x

instance (Eq a, Eq b) => EqProp (Constant a b) where
  (=-=) = eq

-----------------------------------------------------------------------------
--
-- Maybe
--
-----------------------------------------------------------------------------
data Optional a =
    Nada
  | Yep a
  deriving (Eq, Show, Ord)

instance Functor Optional where
  fmap _ Nada = Nada
  fmap f (Yep x) = Yep (f x)

instance Foldable Optional where
  foldr _ x Nada = x 
  foldr f x (Yep y) = f y x

instance Traversable Optional where
  traverse _ Nada = pure Nada
  traverse f (Yep x) = Yep <$> f x 

instance Arbitrary a => Arbitrary (Optional a) where
  arbitrary = do
    x <- arbitrary
    return $ Yep x

instance Eq a => EqProp (Optional a) where
  (=-=) = eq

-----------------------------------------------------------------------------
--
-- List
--
-----------------------------------------------------------------------------
data List a =
    Nil
  | Cons a (List a)
  deriving (Eq, Show, Ord)

instance Functor List where
  fmap _ Nil = Nil
  fmap f (Cons x x') = Cons (f x) (fmap f x') 

instance Monoid (List a) where
  mempty                = Nil
  mappend x Nil         = x
  mappend Nil x         = x
  mappend (Cons x xs) y = Cons x (mappend xs y)

instance Applicative List where
  pure x = Cons x Nil
  Nil <*> _ = Nil
  _ <*> Nil = Nil
  (Cons f fs) <*> (Cons x xs) = Cons (f x) ((pure f <*> xs) `mappend` (fs <*> pure x))

instance Foldable List where
  foldr _ x Nil = x
  foldr f x (Cons y y') = f y (foldr f x y') 

instance Traversable List where
  traverse _ Nil = pure Nil
  traverse f (Cons x xs) = Cons <$> f x <*> traverse f xs

instance Arbitrary a => Arbitrary (List a) where
  arbitrary = do
    x <- arbitrary
    return $ Cons x Nil

instance Eq a => EqProp (List a) where
  (=-=) = eq

-----------------------------------------------------------------------------
--
-- Three
--
-----------------------------------------------------------------------------
data Three a b c = Three a b c deriving (Eq, Show)

instance Functor (Three a b) where
  fmap f (Three x y z) = Three x y (f z)

instance Foldable (Three a b) where
  foldr f z (Three w x y) = f y z

instance Traversable (Three a b) where
  traverse f (Three x y z) = Three x y <$> f z

instance (Arbitrary a, Arbitrary b, Arbitrary c) => Arbitrary (Three a b c) where
  arbitrary = do
    x <- arbitrary
    y <- arbitrary
    z <- arbitrary
    return $ Three x y z

instance (Eq a, Eq b, Eq c) => EqProp (Three a b c) where
  (=-=) = eq

-----------------------------------------------------------------------------
--
-- Pair
--
-----------------------------------------------------------------------------
data Pair a b = Pair a b deriving (Eq, Show)

instance Functor (Pair a) where
  fmap f (Pair x y) = Pair x (f y)

instance Foldable (Pair a) where
  foldr f z (Pair x y) = f y z

instance Traversable (Pair a) where
  traverse f (Pair x y) = Pair x <$> f y

instance (Arbitrary a, Arbitrary b) => Arbitrary (Pair a b) where
  arbitrary = do
    x <- arbitrary
    y <- arbitrary
    return $ Pair x y

instance (Eq a, Eq b) => EqProp (Pair a b) where
  (=-=) = eq

-----------------------------------------------------------------------------
--
-- Big
--
-----------------------------------------------------------------------------
data Big a b = Big a b b deriving (Eq, Show)

instance Functor (Big a) where
  fmap f (Big x y y') = Big x (f y) (f y')

instance Foldable (Big a) where
  foldr f z (Big x y y') = f y $ f y' z 

instance Traversable (Big a) where
  traverse f (Big x y y') = Big x <$> f y <*> f y'

instance (Arbitrary a, Arbitrary b) => Arbitrary (Big a b) where
  arbitrary = do
    x <- arbitrary
    y <- arbitrary
    return $ Big x y y

instance (Eq a, Eq b) => EqProp (Big a b) where
  (=-=) = eq

-----------------------------------------------------------------------------
--
-- Bigger
--
-----------------------------------------------------------------------------
data Bigger a b = Bigger a b b b deriving (Eq, Show)

instance Functor (Bigger a) where
  fmap f (Bigger x y y' y'') = Bigger x (f y) (f y') (f y'')

instance (Arbitrary a, Arbitrary b) => Arbitrary (Bigger a b) where
  arbitrary = do
    x <- arbitrary
    y <- arbitrary
    return $ Bigger x y y y

instance (Eq a, Eq b) => EqProp (Bigger a b) where
  (=-=) = eq

-----------------------------------------------------------------------------
type TupleOfStuff = (Int, Int, [Int])
type OneThing = Int

idTrigger       = undefined :: Identity TupleOfStuff 
constantTrigger = undefined :: Constant OneThing TupleOfStuff
optionalTrigger = undefined :: Optional TupleOfStuff
listTrigger     = undefined :: List TupleOfStuff
threeTrigger    = undefined :: Three OneThing OneThing TupleOfStuff
pairTrigger     = undefined :: Pair OneThing TupleOfStuff
bigTrigger      = undefined :: Big OneThing TupleOfStuff
biggerTrigger   = undefined :: Bigger OneThing TupleOfStuff

main = do
  putStr $ title "Identity"
  quickBatch (traversable idTrigger)

  putStr $ title "Constant"
  quickBatch (traversable constantTrigger)

  putStr $ title "Optional"
  quickBatch (traversable optionalTrigger)
  
  putStr $ title "List"
  quickBatch (traversable listTrigger)

  putStr $ title "Three"
  quickBatch (traversable threeTrigger)

  putStr $ title "Pair"
  quickBatch (traversable pairTrigger)
  
  putStr $ title "Big"
  quickBatch $ traversable bigTrigger

  putStr $ title "Bigger"
  quickBatch $ functor biggerTrigger

title :: String -> String
title xs = "\n======" ++ xs

