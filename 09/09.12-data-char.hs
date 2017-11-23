import           Data.Char

-----------------------------------------------------------------------------
-- 1.
--
-- isUpper :: Char -> Bool
-- toUpper :: Char -> Char

-----------------------------------------------------------------------------
-- 2.
filterUpper :: String -> String
filterUpper = filter isUpper

-----------------------------------------------------------------------------
-- 3.
caps :: String -> String
caps [] = []
caps xs = toUpper (head xs) : tail xs

-----------------------------------------------------------------------------
-- 4.
allCaps :: String -> String
allCaps []     = []
allCaps (x:xs) = toUpper x : allCaps xs

-----------------------------------------------------------------------------
-- 5.
toUpperFirst :: String -> Char
toUpperFirst xs = toUpper $ head xs

-----------------------------------------------------------------------------
-- 7.
toUpperFirst' :: String -> Char
toUpperFirst' = toUpper . head
