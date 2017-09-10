-- Choices for the following are:
  -- fully polymorphic type variable
  -- constrained polymorphic type variable
  -- concrete type constructor

-- 1. 
f0 :: Num a => a -> b -> Int -> Int
--            [0]  [1]   [2]    [3]
-- 0 constrained polymorphic type variable
-- 1 fully polymorphic type variable
-- 2 concrete type constructor
-- 3 concrete type constructor

-- 2.
f1 :: zed -> Zed -> Blah
 --   [0]    [1]    [2]
-- 0 fully polymorphic type variable
-- 1 concrete type constructor
-- 2 concrete type constructor

-- 3.
f2 :: Enum b => a -> b -> C
--        [0]  [1]  [2]  [3]
-- 0 constrained polymorphic type variable
-- 1 fully polymorphic type variable
-- 2 constrained polymorphic type variable
-- 3 concrete type constructor

-- 4.
f3 :: f -> g -> C
--   [0]  [1]  [2]
-- 0 fully polymorphic type variable
-- 1 fully polymorphic type variable
-- 2 concrete type constructor

