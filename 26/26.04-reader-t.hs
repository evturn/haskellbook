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
