-- Algebraic datatypes in Haskell are algebraic.

-- They are algebraic because we can describe patterns of argument structures
-- using two basic operations:
--  sum and product.

-- Cardinality

-- The number of elements in a set.
-- The cardinality of a datatype is the number of possible values it defines.
-- Knowing how many possible values inhabit a type allows you to determine how
-- many possible implementations there are of a function for a given type signature.
--
-- `Bool` has two nullary data constructors making the cardinality 2.
--
-- `Int8` has an upper bound of 127 and a lower bound of -`128` making the cardinality 256.
-- 128 + 1 + 127 = 256.
-- That means there are 256 possible runtime values.
--
data Example = MakeExample

:type MakeExample
-- MakeExample :: Example

data Example2 = MakeExample Int

:type MakeExample
-- MakeExample :: Int -> Example2

-- Adding the single type argument to the MakeExample data
-- constructor changed it from a nullary constructor to a
-- unary constructor.
--
-- A unary constructor takes one argument.
-- In the declaration of the datatype, that parameter will
-- be a type, not a value.
-- The value will be constructed at runtime from the
-- argument we applied it to.
--
-- Datatypes that only contain a unary constructor always
-- have the same cardinality as the type they contain.
--

data Goats = Goats Int deriving (Eq, Show)

-- Anything that is a valid Int must be a valid argument to
-- the `Goats` constructor.
-- Anything that isn't a valid Int also isn't a valid count
-- of `Goats`.
--
-- For cardinality this means unary constructors are the
-- identity function.
--
--
--
-- A `newtype` is similar to a type synonym in that the representations
-- of the named type and the type it contains are identical and any distinction
-- between them is gone at compile time.

-- So on the surface for human writers and readers of code, the distinction can be
-- helpful in tracking where data came from and what it's being used for, but
-- the difference is irrelevant to the compiler.

-- However, one key contrast between a `newtype` and a type alias is that you
-- can define typeclass instances for `newtype`s that differ from the instances for
-- their underlying type.

class TooMany a where
  tooMany :: a -> Bool

instance TooMany Int where
  tooMany n = n > 42

newtype Goats = Goats Int deriving Show

instance TooMany Goats where
  tooMany (Goats n) = n > 43

tooMany (42 :: Int)
-- False

tooMany (42)
-- error:
--  • Ambiguous type variable ‘a0’ arising from a use of ‘tooMany’
--    prevents the constraint ‘(TooMany a0)’ from being solved.
--    Probable fix: use a type annotation to specify what ‘a0’ should be.
--    These potential instance exist:
--      instance [safe] TooMany Int

-- The three definitions (`class`, `data` type, `instance`) are completely separate
-- and there is no rule about how they are grouped.

-- Classes are not types, but categories of types and so instances of a class are types
-- instead of values.

-- Type synonyms defined with the `type` keyword cannot be made instances of a class.