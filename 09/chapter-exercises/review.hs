import Data.Char

-- 1.
-- isUpper :: Char -> Bool
-- toUpper :: Char -> Char

-- 2.
onlyLowerCase :: [Char] -> [Char]
onlyLowerCase = filter (not . isUpper)

-- 3.
capitalize :: [Char] -> [Char]
capitalize xs = (toUpper . head) xs : (tail xs)

-- 4.
allCaps :: [Char] -> [Char]
allCaps []     = []
allCaps (x:xs) = (toUpper x) : (allCaps xs)

-- 5.
fstCaps :: [Char] -> Char
fstCaps = (toUpper . head)

-- 6.
-- See 5.
