-- Rearrange the arguments of the type constuctor of the datatype so
-- the `Functor` instance works.
--
-----------------------------------------------------------------------------
-- 1.
data Sum b a = First a
             | Second b

instance Functor (Sum e) where
  fmap f (First a)  = First (f a)
  fmap f (Second b) = Second b

-----------------------------------------------------------------------------
-- 2.
data Company a c b = DeepBlue a c
                   | Something b

instance Functor (Company e e') where
  fmap f (Something b)  = Something (f b)
  fmap _ (DeepBlue a c) = DeepBlue a c
