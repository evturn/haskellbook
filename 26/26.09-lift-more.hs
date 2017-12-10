import           Control.Monad.Trans.Class

-----------------------------------------------------------------------------
-- 1.
newtype EitherT e m a = EitherT
  { runEitherT :: m (Either e a) }

instance MonadTrans (EitherT e) where
  lift = EitherT . fmap Right

-----------------------------------------------------------------------------
-- 2.
newtype StateT s m a = StateT
  { runStateT :: s -> m (a, s) }

instance MonadTrans (StateT s) where
  lift m = StateT $ \s -> do
    a <- m
    return (a, s)
