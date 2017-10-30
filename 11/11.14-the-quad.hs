-- Determine how many unique inhabitants each type has?
data Quad = One
          | Two
          | Three
          | Four
          deriving (Eq, Show)

-- 1.
eQuad :: Either Quad Quad
eQuad = undefined
-- Answer: 
-- Either = Quad 4 | Quad 4
-- 8      =      4 + 4
--
-- There are 8 different possible implementations.

-- 2.
prodQuad :: (Quad, Quad)
prodQuad = undefined
-- Answer:
-- (Quad 4, Quad 4)
-- 16 =  4 * 4
--
-- There are 16 different possible implementations.

-- 3.
funcQuad :: Quad -> Quad
funcQuad = undefined
-- Answer:
-- Quad 4 -> Quad 4
-- 256 =  4 ^ 4
--
-- There are 256 different possible implementations.

-- 4.
prodTBool :: (Bool, Bool, Bool)
prodTBool = undefined
-- Answer:
-- (Bool 2, Bool 2, Bool 2)
-- 8 =   2 *     2 *     2
--
-- There are 8 different possible implementations.

-- 5.
gTwo :: Bool -> Bool -> Bool
gTwo = undefined
-- Answer:
-- Bool 2 -> Bool 2 -> Bool 2
-- 16 = 2 ^       2 ^       2
--
-- There are 16 different possible implementations.

fTwo :: Bool -> Quad -> Quad
fTwo = undefined
-- Answer:
-- Bool 2 -> Quad 4 -> Quad 4
-- 65536 = (2 ^      4) ^     4
--
-- There are 65536 different possible implementations.


