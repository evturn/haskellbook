{-# LANGUAGE InstanceSigs #-}

-- 1.
myLiftA2 :: Applicative f => (a -> b -> c) -> f a -> f b -> f c
myLiftA2 f fa fb = f <$> fa <*> fb 

-- 2.
newtype Reader r a = Reader { runReader :: r -> a }

asks :: (r -> a) -> Reader r a
asks f = Reader f

-- 3.
instance Functor (Reader r) where
  fmap f (Reader r) = Reader $ f . r

instance Applicative (Reader r) where
  pure :: a -> Reader r a
  pure a = Reader $ \_ -> a 

  (<*>) :: Reader r (a -> b)
        -> Reader r a
        -> Reader r b
  (Reader rab) <*> (Reader ra) = 
    Reader $ \r -> rab r (ra r) 
