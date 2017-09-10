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


