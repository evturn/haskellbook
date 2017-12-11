import           Control.Monad.Trans.Reader

-----------------------------------------------------------------------------
-- 1.
rDec :: Num a => Reader a a
rDec = ReaderT $ return . \x -> x - 1

-----------------------------------------------------------------------------
-- 2.
rDec' :: Num a => Reader a a
rDec' = ReaderT $ return . ((+) (-1))

