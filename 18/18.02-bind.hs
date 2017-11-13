import           Control.Monad (join)

-- Write `bind` in terms of `fmap` and `join`.
bind :: Monad m => (a -> m b) -> m a -> m b
bind f x = join $ f <$> x
