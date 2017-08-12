import Data.Int

-- 1.
data BigSmall =
    Big Bool
  | Small Bool
  deriving (Eq, Show)

-- Cardinality of 2.

-- 2.
data NumberOrBool =
    Numba Int8
  | BoolyBool Bool
  deriving (Eq, Show)

myNumba = Numba (-128)
