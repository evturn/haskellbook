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
  foldMap = undefined

instance Traversable Tree where
  traverse = undefined
