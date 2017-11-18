import           Data.Char

cap :: [Char] -> [Char]
cap xs = map toUpper xs

rev :: [Char] -> [Char]
rev xs = reverse xs

composed :: [Char] -> [Char]
composed = rev . cap

fmapped :: [Char] -> [Char]
fmapped = fmap rev cap

tupled :: [Char] -> ([Char], [Char])
tupled = do
  x <- cap
  y <- rev
  return (x, y)

tupled' :: [Char] -> ([Char], [Char])
tupled' = rev >>= \x ->
          cap >>= \y ->
          return (x, y)
