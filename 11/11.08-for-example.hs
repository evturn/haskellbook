-- 1.
-- What is the type of data constructor `MakeExample`? What happens if you
-- query the type of `Example`?
data Example = MakeExample deriving Show
-- Answer: Nullary. You can query the type of a data constructor but
-- it makes no sense to query the type of a type constructor since itself
-- is a type.

-- 2. What happens if you query the info on `Example` and can you determine
-- what typeclass instances are defined for it?
-- Answer: The definition is printed along with the instances it has.

-- 3.
-- What gets printed in the REPL if you make a new datatype like `Example`
-- but with a single type argument added to `MakeExample`?
data Example' = MakeExample' Int deriving Show
-- Answer: MakeExample' :: Int -> Example'
