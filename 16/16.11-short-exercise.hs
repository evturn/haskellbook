incIfRight :: Num a => Either e a -> Either e a
incIfRight (Right n) = Right $ n + 1
incIfRight (Left e)  = Left e

showIfRight :: Show a => Either e a -> Either e String
showIfRight (Right s) = Right $ show s
showIfRight (Left e)  = Left e

incEither :: Num a => Either e a -> Either e a
incEither = fmap (+1)

showEither :: Show a => Either e a -> Either e String
showEither = fmap show

liftedInc :: (Functor f, Num a) => f a -> f a
liftedInc = fmap (+1)

liftedShow :: (Functor f, Show a) => f a -> f String
liftedShow = fmap show

-----------------------------------------------------------------------------
-- 1.
data Sum a b = First a
             | Second b
             deriving (Eq, Show)

instance Functor (Sum a) where
  fmap _ (First x)  = First x
  fmap f (Second y) = Second (f y)

applyIfSecond :: (a -> b) -> (Sum e) a -> (Sum e) b
applyIfSecond f s = fmap f s

-----------------------------------------------------------------------------
-- 2.
-- Why is a `Functor` instance that applies the function only to `First`,
-- `Either`'s `Left`, impossible?
--
-- Answer:
-- A type constructor with more than two type arguments must include all
-- type arguments except the inner-most argument as part of the Functorial
-- structure being preserved.
