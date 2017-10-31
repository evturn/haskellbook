import Data.Char

charCodes :: [Int]
charCodes = fmap ord ['a'..'z']
  
wrapLeft :: Int -> Int
wrapLeft n
    | n > (last charCodes) = n - (last charCodes) + (head charCodes - 1)
    | otherwise            = n

wrapRight :: Int -> Int
wrapRight n
    | n < (head charCodes) = n + (last charCodes) - (head charCodes - 1)
    | otherwise            = n

shiftChar :: Int -> Char -> Char
shiftChar n ch = chr $ wrapLeft (n + ord ch)

unshiftChar :: Int -> Char -> Char
unshiftChar n co = chr $ wrapRight (ord co - n)

caesar :: Int -> String -> String
caesar _ [] = []
caesar n xs = fmap (shiftChar n) xs

uncaesar :: Int -> String -> String
uncaesar _ [] = []
uncaesar n xs = fmap (unshiftChar n) xs

table :: [(Char, Int)]
table = zip ['a'..'z'] [0..]

