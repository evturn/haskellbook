import Data.Char

cap :: [Char] -> [Char]
cap xs = map toUpper  xs

rev :: [Char] -> [Char]
rev xs = reverse xs

composed :: [Char] -> [Char]
composed = cap . rev

fmapped :: [Char] -> [Char]
fmapped = cap <$> rev

tupled :: [Char] -> ([Char], [Char])
tupled xs = (cap xs, rev xs) 
