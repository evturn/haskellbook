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

-----------------------------------------------------------------------------
-- Constant
--
newtype Constant a b = Constant
                     { getConstant :: a }
                     deriving (Eq, Show)

instance Functor (Constant a) where
  fmap _ (Constant y) = Constant y

instance Foldable (Constant a) where
  foldr _ z _ = z

instance Traversable (Constant a) where
  traverse f (Constant x) = pure $ Constant x

instance (Arbitrary a, Arbitrary b) => Arbitrary (Constant a b) where
  arbitrary = do
    x <- arbitrary
    return $ Constant x

instance (Eq a, Eq b) => EqProp (Constant a b) where
  (=-=) = eq

constantTraversable :: Constant Int IIIs
constantTraversable = undefined

-----------------------------------------------------------------------------
-- Maybe
--
data Optional a = Nada
                | Yep a
                deriving (Eq, Show)

instance Functor Optional where
  fmap _ Nada    = Nada
  fmap f (Yep x) = Yep (f x)

instance Foldable Optional where
  foldMap _ Nada    = mempty
  foldMap f (Yep x) = f x

instance Traversable Optional where
  traverse _ Nada    = pure Nada
  traverse f (Yep x) = Yep <$> f x

instance Arbitrary a => Arbitrary (Optional a) where
  arbitrary = do
    x <- arbitrary
    elements [ Nada
             , Yep x
             ]

instance Eq a => EqProp (Optional a) where
  (=-=) = eq

maybeTraversable :: Optional IIIs
maybeTraversable = undefined

-----------------------------------------------------------------------------
-- List
data List a = Nil
            | Cons a (List a)
            deriving (Eq, Show)

instance Functor List where
  fmap _ Nil        = Nil
  fmap f (Cons x y) = Cons (f x) (fmap f y)

instance Foldable List where
  foldMap _ Nil        = mempty
  foldMap f (Cons x y) = f x `mappend` foldMap f y

instance Traversable List where
  traverse _ Nil        = pure Nil
  traverse f (Cons x y) = Cons <$> f x <*> traverse f y

instance Arbitrary a => Arbitrary (List a) where
  arbitrary = do
    x <- arbitrary
    return $ Cons x Nil

instance Eq a => EqProp (List a) where
  (=-=) = eq

listTraversable :: List IIIs
listTraversable = undefined

-----------------------------------------------------------------------------
-- Three
data Three a b c = Three a b c
  deriving (Eq, Show)

instance Functor (Three a b) where
  fmap f (Three x y z) = Three x y (f z)

instance Foldable (Three a b) where
  foldMap f (Three _ _ z) = f z

instance Traversable (Three a b) where
  traverse f (Three x y z) = Three x y <$> f z

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

threeTraversable :: Three Int Int IIIs
threeTraversable = undefined


main :: IO ()
main = do
  putStrLn "\n-- Identity"
  quickBatch $ functor     identityTraversable
  quickBatch $ traversable identityTraversable
  putStrLn "\n-- Constant"
  quickBatch $ functor     constantTraversable
  quickBatch $ traversable constantTraversable
  putStrLn "\n-- Maybe"
  quickBatch $ functor     maybeTraversable
  quickBatch $ traversable maybeTraversable
  putStrLn "\n-- List"
  quickBatch $ functor     listTraversable
  quickBatch $ traversable listTraversable
  putStrLn "\n-- Three"
  quickBatch $ functor     threeTraversable
  quickBatch $ traversable threeTraversable
