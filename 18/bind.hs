import Data.Functor
import Control.Monad (join)

bind' :: Monad m => (a -> m b) -> m a -> m b
bind' st s = join (fmap st s)
