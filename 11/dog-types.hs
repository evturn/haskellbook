-- 1.
-- Keyword `data` signals what follow is a data declaration or a declaration of a datatype.

-- 2.
-- Type constuctor or type constant.

-- 3.
-- Equals sign. Divides the type constructor from its data constructors.

-- 4.
-- Data constructor. A nullary constructor in this case since is takes no arguments. This is one of the possible values of this type that can show up in term-level code.

-- 5.
-- The pipe denotes a sum type which indicates a logical disjunction (OR) in what values can have that type.

-- 6.
-- Data constructor. Another nullary constructor, for the value `True`.

-- 7.
-- Type constructor (with an argument) which an empty list has to be applied to an argument in order to become a list of something. In this case, the argument is a polymophic type variable, so the list's argument can be of different types.

-- 8.
-- Data constructor for the empty list.

-- 9.
-- Data constructor (with two arguments) an `a` and also a `[a]`.
