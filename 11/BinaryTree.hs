data BinaryTree a =
    Leaf
  | Node (BinaryTree a) a (BinaryTree a)
  deriving (Eq, Ord, Show)

insert' :: Ord a => a -> BinaryTree a -> BinaryTree a
insert' b Leaf = Node Leaf b Leaf
insert' b (Node left a right)
  | b == a = Node left a right
  | b < a  = Node (insert' b left) a right
  | b > a  = Node left a (insert' b right)

-- The base case serves a couple purposes.
-- Handles inserting into an empty tree (Leaf)
-- Handles constructing a new tree
-- Handles having reached the bottom of a much larger tree.

t1 = insert' 0 Leaf
-- Node Leaf 0 Leaf
t2 = insert' 3 t1
-- Node Leaf 0 (Node Leaf 3 Leaf)
t3 = insert' 5 t2
-- Node Leaf 0 (Node Leaf 3 (Node Leaf 5 Leaf))

--------------------------

-- f :: (a -> b)
-- left :: BinaryTree a
-- a :: a
-- right :: BinaryTree a

mapTree :: (a -> b) -> BinaryTree a -> BinaryTree b
mapTree _ Leaf = Leaf
mapTree f (Node left a right) =
  Node (mapTree f left) (f a) (mapTree f right)

testTree' :: BinaryTree Integer
testTree' =
  Node (Node Leaf 3 Leaf) 1 (Node Leaf 4 Leaf)

mapExpected = Node (Node Leaf 4 Leaf) 2 (Node Leaf 5 Leaf)

mapOkay = if mapTree (+1) testTree' == mapExpected then print "Yes things were fine." else error "Test found things to be kinda bad."

--------------------------

preorder :: BinaryTree a -> [a]
preorder Leaf = []
preorder (Node left a right) = [a] ++ preorder left ++ preorder right

inorder :: BinaryTree a -> [a]
inorder Leaf = []
inorder (Node left a right) = inorder left ++ [a] ++ inorder right

postorder :: BinaryTree a -> [a]
postorder Leaf = []
postorder (Node left a right) = postorder left ++ postorder right ++ [a]

testTree :: BinaryTree Integer
testTree = Node (Node Leaf 1 Leaf) 2 (Node Leaf 3 Leaf)

testPreorder :: IO ()
testPreorder = if preorder testTree == [2, 1, 3] then putStrLn "Preorder was chill." else putStrLn "Preorder not chill."

testInorder :: IO ()
testInorder = if inorder testTree == [1, 2, 3] then putStrLn "Inorder was totally chill" else putStrLn "Inorder not good."

testPostorder :: IO ()
testPostorder = if postorder testTree == [1, 3, 2] then putStrLn "Postorder was cool" else putStrLn "Postorder not cool."

main :: IO ()
main = do
  testPreorder
  testInorder
  testPostorder
