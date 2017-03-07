-- The list datatype

-- data [] a = [] | a : [a]

-- `[]`
  -- type constuctor for lists
  -- data constructor for the empty list
    -- the [] data constructor is a nullary constrctor
    -- a sum type
-- `:`
  -- data constructor and infix operator
    -- a product because it takes two arguments

-- A sum type can be read as "or" (as in `Bool` where you get `False` or `True`)
-- A product can be read as "and"

-- data [] a = [] | a : [a]
--      1  2 3 4  5   6

-- 1. The datatype with the type constructor []
-- 2. takes a single type constructor argument 'a'
-- 3. at the term level can be constructed via
-- 4. nullary constructor []
-- 5. or it can be constructed by
-- 6. data constructor (`ßß:`) which is a product of a value of the type `a` mentioned
--    in the type constructor and a value of type `[a]` (more list).

-- (`:`) is an infix data constructor and goes between two arguments `a` and `[a]`
  -- Since it takes two arguments, it is a product of those two arguments (like the tuple type `(a, b)`).
    -- Unlike the tuple, the (`:`) data constructor is recursive because it mentions its own
    -- type `[a]` as one of the members of the product.

head'       :: [a] -> Maybe a
head' []    = Nothing
head' (x:_) = Just x

eftBool :: Bool -> Bool -> [Bool]
eftBool False False = [False]
eftBool False True  = [False, True]
eftBool True False  = []
eftBool True True   = [True]

eftOrd :: Ordering -> Ordering -> [Ordering]
eftOrd LT LT = [LT]
eftOrd LT EQ = [LT, EQ]
eftOrd LT GT = [LT, EQ, GT]
eftOrd EQ LT = []
eftOrd EQ EQ = [EQ]
eftOrd EQ GT = [EQ, GT]
eftOrd GT LT = []
eftOrd GT EQ = []
eftOrd GT GT = [GT]

eftInt :: Int -> Int -> [Int]
eftInt a b
  | a > b                   = []
  | a == b || a == maxBound = [a]
  | otherwise               = a : eftInt (succ a) b

eftChar :: Char -> Char -> [Char]
eftChar a b
  | a > b                   = []
  | a == b || a == maxBound = [a]
  | otherwise               = a : eftChar (succ a) b