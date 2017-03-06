-- Product type (&&)
--  A type made up of a set of types compounded over each other.
--  Products are represented using tuples or data constructors with more than 1 argument.
--  Products of types represent a conjunction "and" of those types.

-- Sum type (||)
--  A type of two types whose terms are terms in either type but not simultaneously.
--  Sum types are represented using the pipe, `|`, in a datatype definition.
--  Sums of types represent a disjunction, "or", of those types.

-- Cons
--  Ordinarily used to signify that a list value has been created by 'cons'ing a value onto the head
--  of another list value.
--  (:) is the cons operator for the list type
--  (:) is a data constructor defined in the list datatype.

-- Cons cell
--  A data constructor and a product of the types `a` and `[a]`/
--  Because it references the list type constructor itself in the second argument, it allows for
--  nesting of multiple cons cells, possibly indefinitely with the use of recursive functions.

-- spine
--  A way to refer to the structure that glues a collection of values together.
--  In the list datatype it formed by the recursive nesting of cons cells.
--  The structure of a collection that isn't the values contained therein.