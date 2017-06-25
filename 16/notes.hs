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

{- 𝑓

class Sumthin a where
  s :: a -> a

class Else where
  e :: b -> f (g a b c)

class Biffy where
  slayer :: e a b -> (a -> c) -> (b -> d) -> e c d

class Impish v where
  impossibleKind :: v -> v a

class AlsoImp v where
  nope :: v a -> v

-}

-- Functor is a typeclass for function application “over”, or “through”, or “past” some structure f
   -- that we want to ignore and leave untouched.

data FixMePls a = FixMe
                | Pls a
                deriving (Eq, Show)

instance Functor FixMePls where
  fmap _ FixMe = FixMe
  fmap f (Pls a) = Pls (f a)

-- Notice the function gets applied over and inside of the “structure.”


-- Instances of the Functor typeclass should abide by two basic laws.
   -- Identity
   -- Composition

fmap ((+1) . (*2) [1..5])
-- [3,5,7,9,11]
fmap (+1) . fmap (*2) $ [1..5]
-- [3,5,7,9,11]

-- in other words:
fmap (f . g) == fmap f . fmap g

-- two functions lifted separately should produce the same result as if the function were composed
   -- ahead of time and then lifted the composed function all together.

fmapComposed :: (Functor f1, Functor f) => (a -> b) -> f (f1 a) -> f (f1 b)
fmapComposed = (fmap . fmap)