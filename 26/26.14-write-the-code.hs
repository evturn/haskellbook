import           Control.Monad.Trans.Reader
import           Data.Functor.Identity

-----------------------------------------------------------------------------
-- 1.
rDec :: Num a => Reader a a
rDec = ReaderT $ return . \x -> x - 1

-----------------------------------------------------------------------------
-- 2.
rDec' :: Num a => Reader a a
rDec' = ReaderT $ return . ((+) (-1))

-----------------------------------------------------------------------------
-- 3 & 4.
rShow :: Show a => ReaderT a Identity String
rShow = ReaderT $ return . show

-----------------------------------------------------------------------------
-- 5.
rPrintAndInc :: (Num a, Show a) => ReaderT a IO a
rPrintAndInc = ReaderT $ \r -> do
  putStrLn ("Hi: " ++ show r)
  return $ r + 1

