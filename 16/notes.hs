-- Functor is all about a pattern of mapping over structure.

-- Functors are combinators:
   -- they take a sentence or phrase as input and produce a sentence or phrase as an output, with
   -- some logical operation applied to the whole.

-- A functor is a way to apply a function over or around some structure that we don’t want to alter.
   -- That is, we want to apply the function to the value that is “inside” some structure and leave
   -- the structure alone.

-- Definition of the Functor typeclass:

class Functor f where
  fmap :: (a -> b) -> f a -> f b

-- `fmap` takes a function as an argument, a `Functor` f that takes a type argument `a`, then returns
   -- the same `f` while the type argument `b` possibly but not necessarily refers to a different type.

-- Every argument to the type constructor of `->` must be of kind `*`.
-- Each argument and result of every function must be a type constant, not a type constructor.

class Functor f where
  fmap :: (a -> b) ->  f a  ->  f b
-- has kind:  *    ->   *   ->   *

-- The type signature of `fmap` tells us tha the f introduced by the class definition for Functor must
-- accept a single argument and thus be of kind `* -> *`.