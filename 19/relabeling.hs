data Tree a =
    Leaf a
  | Node (Tree a) (Tree a)
  deriving (Eq, Show)

tree :: Tree Char
tree = Node (Node (Leaf 'a') (Leaf 'b')) (Leaf 'c')

rlabel :: Tree a -> Int -> (Tree Int, Int)
rlabel (Leaf _)   n = (Leaf n, n+1)
rlabel (Node l r) n = (Node l' r', n'')
  where
    (l', n')  = rlabel l n
    (r', n'') = rlabel r n'

