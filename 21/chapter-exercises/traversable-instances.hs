import Data.Traversable
import Test.QuickCheck (Arbitrary, arbitrary)
import Test.QuickCheck.Classes
import Test.QuickCheck.Checkers

-- Identity
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

-- Constant
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

-- Maybe
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

-- List
data List a =
    Nil
  | Cons a (List a)
  deriving (Eq, Show, Ord)

instance Functor List where
  fmap _ Nil = Nil
  fmap f (Cons x x') = Cons (f x) (fmap f x') 

instance Foldable List where
  foldr _ x Nil = x
  foldr f x (Cons y y') = f y (foldr f x y') 

instance Arbitrary a => Arbitrary (List a) where
  arbitrary = do
    x <- arbitrary
    return $ Cons x Nil

instance Eq a => EqProp (List a) where
  (=-=) = eq

type TupleOfStuff = (Int, Int, [Int])
type OneThing = Int

idTrigger       = undefined :: Identity TupleOfStuff 
constantTrigger = undefined :: Constant OneThing TupleOfStuff
optionalTrigger = undefined :: Optional TupleOfStuff
listTrigger     = undefined :: List TupleOfStuff

main = do
  putStrLn "\n=============== Identity ===================="
  quickBatch (traversable idTrigger)

  putStrLn "\n=============== Constant ===================="
  quickBatch (traversable constantTrigger)

  putStrLn "\n=============== Optional ===================="
  quickBatch (traversable optionalTrigger)
