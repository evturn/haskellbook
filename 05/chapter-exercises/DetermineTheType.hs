{-# LANGUAGE NoMonomorphismRestriction #-}

module DetermineTheType where


example = 1

a1 = (* 9) 6                                     -- a1 :: Num a => a

b' = head [(0,"doge"),(1,"kitteh")]              -- b' :: Num t => (t, [Char])

c1 = head [(0 :: Integer ,"doge"),(1,"kitteh")]  -- c1 :: (Integer, [Char])

d' = if False then True else False               -- d' :: Bool

e' = length [1, 2, 3, 4, 5]                      -- e' :: Int

f1 = (length [1, 2, 3, 4]) > (length "TACOCAT")  -- f1 :: Bool


x' = 5
y' = x' + 5

w' = y' * 10                                     -- w' :: Num a => a

z' y' = y' + 10                                  -- z' :: Num a => a -> a

f2 = 4 / y'                                      -- f2 :: Fractional a => a


x = "Julie"
y = " <3 "
z = "Haskell"

f3 = x ++ y ++ z                                  -- f3 :: [Char]

bigNum = (^) 5
wahoo = bigNum $ 10


-- Choices for the following are:
  -- fully polymorphic type variable
  -- constrained polymorphic type variable
  -- concrete type constructor

-- f4 :: Num a => a -> b -> Int -> Int
    --          [0]  [1]   [2]    [3]
    -- f4
    -- 0 constrained polymorphic type variable
    -- 1 fully polymorphic type variable
    -- 2 concrete type constructor
    -- 3 concrete type constructor

-- f5 :: zed -> Zed -> Blah
    --  [0]    [1]    [2]
    -- f5
    -- 0 fully polymorphic type variable
    -- 1 concrete type constructor
    -- 2 concrete type constructor

-- f6 :: Enum b => a -> b -> C
    --           [0]  [1]  [2]
    -- f6
    -- 0 fully polymorphic type variable
    -- 1 constrained polymorphic type variable
    -- 2 concrete type constructor

-- f7 :: f -> g -> C
    -- [0]  [1]  [2]
    -- f7
    -- 0 fully polymorphic type variable
    -- 1 fully polymorphic type variable
    -- 2 concrete type constructor


-- functionH :: [a] => a
functionH (x:_) = x

-- functionC :: Ord a => a -> a -> Bool
functionC x y = if (x > y) then True else False

-- functionS (a, b) => b
functionS (x, y) = y


i1 :: a -> a
i1 a = id a

c2 :: a -> b -> a
c2 a b = a

c3 :: b -> a -> b
c3 a b = a

c4 :: a -> b -> b
c4 a b = b

r :: [a] -> [a]
r xs = reverse xs

co :: (b -> c) -> (a -> b) -> a -> c
co bToC aToB a = (bToC (aToB a))

a2 :: (a -> c) -> a -> a
a2 _ a = id a

a3 :: (a -> b) -> a -> b
a3 aToB a = aToB a
