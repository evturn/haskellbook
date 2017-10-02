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
tupled = (,) <$> cap <*> rev

monadic :: [Char] -> ([Char], [Char])
monadic = do
  x <- cap
  y <- rev
  return (x, y)

monadic' :: [Char] -> ([Char], [Char])
monadic' = cap >>= \x -> rev >>= \y -> return (x, y)
