import Data.Traversable
import Test.QuickCheck (Arbitrary, arbitrary, oneof)
import Test.QuickCheck.Classes
import Test.QuickCheck.Checkers

data Tree a =
    Empty
  | Leaf a
  | Node (Tree a) a (Tree a)
  deriving (Eq, Show)

instance Functor Tree where
  fmap _ Empty        = Empty
  fmap f (Leaf x)     = Leaf (f x)
  fmap f (Node l x r) = Node (fmap f l) (f x) (fmap f r)

instance Foldable Tree where
  foldMap _ Empty        = mempty
  foldMap f (Leaf x)     = f x
  foldMap f (Node l x r) = foldMap f l `mappend` f x `mappend` foldMap f r

instance Traversable Tree where
  traverse _ Empty        = pure Empty
  traverse f (Leaf x)     = Leaf <$> f x
  traverse f (Node l x r) = Node <$> traverse f l <*> f x <*> traverse f r

instance Arbitrary a => Arbitrary (Tree a) where
  arbitrary = 
    oneof [ return $ Empty
          , Leaf <$> arbitrary
          , Node <$> arbitrary <*> arbitrary <*> arbitrary 
          ]

instance Eq a => EqProp (Tree a) where
  (=-=) = eq

treeTrigger = undefined :: Tree (Int, Int, [Int])

main :: IO ()
main = do
  quickBatch $ traversable treeTrigger
