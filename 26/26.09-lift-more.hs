import           Control.Monad.Trans.Class

-----------------------------------------------------------------------------
-- 1.
newtype EitherT e m a = EitherT
  { runEitherT :: m (Either e a) }

instance MonadTrans (EitherT e) where
  lift = EitherT . fmap Right
