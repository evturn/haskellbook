newtype StateT s m a = StateT
  { runStateT :: s -> m (a, s) }

-----------------------------------------------------------------------------
-- 1.
instance Functor m => Functor (StateT s m) where
  fmap f (StateT m) = StateT $ \s -> fmap (\(x, s') -> (f x, s')) (m s)
