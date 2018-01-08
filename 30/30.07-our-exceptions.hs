module OurExceptions where

import           Control.Exception

data EATD = NotEven Int
          | NotDivThree Int
          deriving (Eq, Show)

instance Exception EATD

evenAndThreeDiv :: Int -> IO Int
evenAndThreeDiv i
    | rem i 3 /= 0 = throwIO (NotDivThree i)
    | even i       = throwIO (NotEven i)
    | otherwise    = return i

-- catchNotDivThree :: IO Int -> (NotDivThree -> IO Int) -> IO Int
-- catchNotDivThree = catch

-- catchNotEven :: IO Int -> (NotEven -> IO Int) -> IO Int
-- catchNotEven = catch

catchBoth :: IO Int -> IO Int
catchBoth ioInt = catches ioInt
    [ Handler (\(NotEven _) -> return maxBound)
    , Handler (\(NotDivThree _) -> return minBound)
    ]
