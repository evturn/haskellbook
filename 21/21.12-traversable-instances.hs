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
