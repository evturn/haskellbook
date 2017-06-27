
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

-------------------------------
-- fmap
(<$>) :: Functor f =>       (a -> b) -> f a -> f b
-- 'apply'
(<*>) :: Applicative f => f (a -> b) -> f a -> f b


-- The difference is the 𝑓 representing functorial structure that is on the
-- outside of the 'apply' function defintion.
-------------------------------