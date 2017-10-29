import Data.Int

-- 1.
-- What is the cardinality of this datatype?
data BigSmall =
    Big Bool
  | Small Bool
  deriving (Eq, Show)
-- Answer: 2

-- 2.
-- What is the cardinality of `NumberOrBool` and what happens if you try to
-- create a `Numba` with a numerical literal larger than 127 and also with a
-- numerical literal smaller than (-128)?
data NumberOrBool =
    Numba Int8
  | BoolyBool Bool
  deriving (Eq, Show)

n = (-128)
x = Numba n
-- Answer: The cardinality of `NumberOrBool` is 258. If a numeric literal
-- is out of the bounds of the `Int8` type then the compiler uses the
-- remainder of the difference as the value.
