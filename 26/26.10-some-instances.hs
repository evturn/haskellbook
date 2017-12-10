import           Control.Monad.IO.Class
import           Control.Monad.Trans.Class

-----------------------------------------------------------------------------
-- 1.
newtype MaybeT m a = MaybeT
  { runMaybeT :: m (Maybe a) }

instance Functor m => Functor (MaybeT m) where
  fmap f (MaybeT x) = MaybeT $ (fmap . fmap) f x

instance Applicative m => Applicative (MaybeT m) where
  pure x = MaybeT (pure (pure x))
  MaybeT f <*> MaybeT x = MaybeT $ (<*>) <$> f <*> x

instance Monad m => Monad (MaybeT m) where
  return = pure
  MaybeT m >>= f = MaybeT $ do
    v <- m
    case v of
      Nothing -> return Nothing
      Just x  -> runMaybeT (f x)

instance MonadTrans MaybeT where
  lift = MaybeT . fmap Just

instance MonadIO m => MonadIO (MaybeT m) where
  liftIO = lift . liftIO

-----------------------------------------------------------------------------
-- 2.
newtype ReaderT r m a = ReaderT
  { runReaderT :: r -> m a }

instance Functor m => Functor (ReaderT r m) where
  fmap f (ReaderT x) = ReaderT $ (fmap . fmap) f x

instance Applicative m => Applicative (ReaderT r m) where
  pure x = ReaderT $ (pure (pure x))
  ReaderT f <*> ReaderT x = ReaderT $ (<*>) <$> f <*> x

instance Monad m => Monad (ReaderT r m) where
  return = pure
  ReaderT m >>= f = ReaderT $ \r -> do
    x <- m r
    runReaderT (f x) r

instance MonadTrans (ReaderT r) where
  lift = ReaderT . const

instance MonadIO m => MonadIO (ReaderT r m) where
  liftIO = lift . liftIO

-----------------------------------------------------------------------------
-- 3.

newtype StateT s m a = StateT
  { runStateT :: s -> m (a, s) }

instance Functor m => Functor (StateT s m) where
  fmap f (StateT m) = StateT $ \s -> fmap (\(x, s') -> (f x, s')) (m s)

instance Monad m => Applicative (StateT s m) where
  pure x = StateT $ \s -> pure (x, s)
  StateT mf <*> StateT mx = StateT $ \s -> do
    (f, s') <- mf s
    (x, s'') <- mx s'
    return (f x, s'')

instance Monad m => Monad (StateT s m) where
  return = pure
  StateT m >>= f = StateT $ \s -> do
    (x, s') <- m s
    runStateT (f x) s'

instance MonadTrans (StateT s) where
  lift m = StateT $ \s -> do
    a <- m
    return (a, s)

instance MonadIO m => MonadIO (StateT s m) where
  liftIO = lift . liftIO
