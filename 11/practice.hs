-- Data declaration

-- data Bool = False | True
-- [1]  [2] [3] [4] [5] [6]

-- data [] a = [ ] | : [a]
--      [ 7 ]  [8]  [9]

-- 1. Keyword `data`
--    signals what follow is a data declaration or a declaration of a datatype.

-- 2. Type constuctor (with no arguments)

-- 3. Equals sign
--    divides the type constructor from its data constructors.

-- 4. Data constructor
--    a nullary constructor in this case since is takes no arguments. This is one
--    of the possible values of this type that can show up in term-level code.

-- 5. The pipe
--    denotes a sum type which indicates a logical disjunction (OR) in what values
--    can have that type.

-- 6. Data constructor
--    another nullary constructor, for the value `True`.

-- 7. Type constructor (with an argument)
--    which an empty list has to be applied to an argument in order to become a list
--    of something. In this case, the argument is a polymophic type variable, so the
--    list's argument can be of different types.

-- 8. Data constructor
--    for the empty list.

-- 9. Data constructor (with two arguments)
--    an `a` and also a `[a]`.

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

