import Control.Monad ((>=>))

-- ∨ -------------------------------- ∨ ---------------------------------- ∨ --
-- mcomp1 :: Monad m => (b -> m c) -> (a -> m b) -> a -> m c
-- mcomp1 f g a = f (g a)

-- mcomp2 :: Monad m => (b -> m c) -> (a -> m b) -> a -> m c
-- mcomp2 f g a = join (f <$> (g a))

-- mcomp3 :: Monad m => (b -> m c) -> (a -> m b) -> a -> m c
-- mcomp3 f g a = g a >>= f

-- (>=>) :: Monad m => (a -> m b) -> (b -> m c) -> a -> m c
-- flip (.) ::          (a -> b)  ->  (b -> c)  -> a -> c
-- ∧ -------------------------------- ∧ ---------------------------------- ∧ --

sayHi :: String -> IO String
sayHi greeting = do
  putStrLn greeting
  getLine

readM :: Read a => String -> IO a
readM = return . read

getAge :: String -> IO Int
getAge = sayHi >=> readM

askForAge :: IO Int
askForAge = getAge "Hello! How old are you?"

--     (a -> m  b)     -> (b     -> m  c) -> a ->  m  c
-- String -> IO String    String -> IO a   String IO  a
