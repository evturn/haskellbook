newtype StateT s m a = StateT
  { runStateT :: s -> m (a, s) }

-----------------------------------------------------------------------------
-- 1.
instance Functor m => Functor (StateT s m) where
  fmap f (StateT m) = StateT $ \s -> fmap (\(x, s') -> (f x, s')) (m s)

-----------------------------------------------------------------------------
-- 2.
instance Monad m => Applicative (StateT s m) where
  pure x = StateT $ \s -> pure (x, s)
  StateT mf <*> StateT mx = StateT $ \s -> do
    (f, s') <- mf s
    (x, s'') <- mx s'
    return (f x, s'')

