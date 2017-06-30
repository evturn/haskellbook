
-- Applicative is a monoidal functor.

-- Like Functor, The Applicative typeclass allows for function application
-- lifted over structure.
-- But with Applicative the function being applied is also embedded in some
-- structure.

class Functor f => Applicative f where
  pure :: a -> f a
  (<*>) :: f (a -> b) -> f a -> f b

-- Every type that can have an Applicative instance must also have a Functor
--  instance.


-- ∨ -------------------------------- ∨ ---------------------------------- ∨ --

-- fmap
(<$>) :: Functor f =>       (a -> b) -> f a -> f b

-- 'apply'
(<*>) :: Applicative f => f (a -> b) -> f a -> f b

-- The difference is the 𝑓 representing functorial structure
-- that is on the outside of the 'apply' function defintion.

-- ∧ -------------------------------- ∧ ---------------------------------- ∧ --

-- List Applicative typeclass methods
(<*>) ::  f  (a -> b)  -> f   a ->  f  b
(<*>) :: [ ] (a -> b)  -> [ ] a -> [ ] b

-- more syntactically typical
(<*>) ::    [(a -> b)] -> [a]   ->    [b]

pure :: a ->   f  a
pure :: a ->  [ ] a

-- ∨ -------------------------------- ∨ ---------------------------------- ∨ --

-- List Applicative

[(+1), (*2)] <*> [2, 4]

-- It maps each function value from the first list over the second list.
-- It then applies the operations and returns one list.

-- [3,5,4,8]

-- ∧ -------------------------------- ∧ ---------------------------------- ∧ --


(<*>) :: Applicative f => f (a -> b) -> f a -> f b

listApply :: [(a -> b)] -> [a] -> [b]
listFmap  ::  (a -> b)  -> [a] -> [b]

-- The 𝑓 structure wrapping the function in `listApply` is itself a list, meaning
-- `a -> b` from Functor has become a list of `a -> b`


-- ∨ -------------------------------- ∨ ---------------------------------- ∨ --

-- Tuple Applicative

(,) <$> [1, 2] <*> [3, 4]

-- Using the `fmap` infix operator `<$>` to map the tuple constructor `(,)` over
-- the first list `[1, 2]`.
-- This embeds an unapplied function (the tuple constructor) into some structure
-- (the list) and returns a list of partially applied functions.

-- First `fmap` lifts the `(,)` over the first list.
-- Then returns a list of partially applied functions.
-- [(1, ), (2, )] <*> [3, 4]

-- Then apply the first list `[(1, ), (2, )]`
-- <*>
-- to the second list `[3, 4]`
-- [(1,3),(1,4),(2,3),(2,4)]

-- ∧ -------------------------------- ∧ ---------------------------------- ∧ --
