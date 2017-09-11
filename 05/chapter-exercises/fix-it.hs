module Sing where

-- 1.
fstString :: [Char] -> [Char]
fstString x = x ++ " in the rain"

sndString :: [Char] -> [Char]
sndString x = x ++ " over the rainbow"

-- 2.
sing = 
  if (x < y) 
     then fstString x 
     else sndString y
  where x = "Singin"
        y = "Somewhere"

-- 3.
main :: IO ()
main = do
  print ((+) 1 2)
  print 10
  print (negate (-1))
  print ((+) 0 blah)
  where blah = negate 1
