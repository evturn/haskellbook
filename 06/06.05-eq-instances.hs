-- 1.
data TisAnInteger = TisAn Integer
  deriving Show

instance Eq TisAnInteger where
  (==) (TisAn x) (TisAn y) = x == y

-----------------------------------------------------------------------------
-- 2.
data TwoIntegers = Two Integer Integer
  deriving Show

instance Eq TwoIntegers where
  (==) (Two x y) (Two x' y') = x == x' && y == y'

-----------------------------------------------------------------------------
-- 3.
data StringOrInt = TisAnInt   Int
                 | TisAString String
                 deriving Show

instance Eq StringOrInt where
  (==) (TisAnInt x) (TisAnInt y)     = x == y
  (==) (TisAString x) (TisAString y) = x == y
  (==) _ _                           = False

-----------------------------------------------------------------------------
-- 4.
data Pair a = Pair a a
  deriving Show

instance Eq a => Eq (Pair a) where
  (==) (Pair x y) (Pair x' y') = x == x' && y == y'

-----------------------------------------------------------------------------
-- 5.
data Tuple a b = Tuple a b
  deriving Show

instance (Eq a, Eq b) => Eq (Tuple a b) where
  (==) (Tuple x y) (Tuple x' y') = x == x' && y == y'

-----------------------------------------------------------------------------
-- 6.
data Which a = ThisOne a
             | ThatOne a
             deriving Show

instance Eq a => Eq (Which a) where
  (==) (ThisOne x) (ThisOne x') = x == x'
  (==) (ThatOne x) (ThatOne x') = x == x'
  (==) _ _                      = False

-----------------------------------------------------------------------------
-- 7.
data EitherOr a b = Hello a
                  | Goodbye b
                  deriving Show

instance (Eq a, Eq b) => Eq (EitherOr a b) where
  (==) (Hello x) (Hello x')     = x == x'
  (==) (Goodbye x) (Goodbye x') = x == x'
  (==) _ _                      = False


