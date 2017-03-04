module MyWords where

myWords :: String -> [String]
myWords []       = []
myWords (' ':xs) = myWords xs
myWords xs       = a : myWords b
  where
    a = takeWhile (/= ' ') xs
    b = dropWhile (/= ' ') xs