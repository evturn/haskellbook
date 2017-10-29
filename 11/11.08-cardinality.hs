-- 1.
-- Calculate the cardinality.
data PugType = PugData
-- Answer: 1

-- 2.
-- Calculate the cardinality.
data Airline =
    PapuAir
  | CatapultsR'Us
  | TakeYourChancesUnited
-- Answer: 3

-- 3.
-- What is the cardinality of Int16?
-- (minBound :: Int16) == -32768
-- (maxBound :: Int16) == 32767
-- (32768 + 1 + 32767) == 65536
--
-- Answer: 65536

-- 4.
-- What can you say about the cardinality of `Int` and `Integer` based off
-- using `maxBound` and `minBound` in the REPL.
--
-- Answer: `Integer` type has no instance of the `Bounded` typeclass.

-- 5.
-- What is the connection between 8 in `Int8` and that type's cardinality
-- of 256?
-- 2 ^ 8 == 256
-- Answer: A bit is either a 0 or a 1, which give a cardinality of 2.
