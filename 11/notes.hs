-- datatype
-- How we declare and create data for our functions to receive as inputs.
-- Made up of a type constuctor and zero or more data constructors
--   which each have zero or more arguments.

-- Data declaration

-- data Bool = False | True
-- [1]  [2] [3] [4] [5] [6]

-- data [] a = [ ] | : [a]
--      [ 7 ]  [8]  [9]

-- Sum type is a type that has more than one constructor inhabiting it.

-- Product type is a type where data constructors hass more than one parameter.

-- data MyType = MyVal Int deriving (Eq, Show)
--      [1]      [2]   [3] [4]      [5]

-- 1. Type constructor

-- 2. Data constructor
--    `MyVal` takes one type argument, so it is called a unary data constructor.

-- 3. Type argument
--    to the definition of the data constructor from [2].

-- 4. Deriving clause

-- 5. Typeclass instances
--    being derived (Equality `Eq` and value stringification `Show`).
