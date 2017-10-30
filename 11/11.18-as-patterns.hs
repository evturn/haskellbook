import Data.Char (toUpper)

-- 1.
-- This should return `True` if (and only if) all the values in the first list
-- appear in the second list.
isSubseqOf :: (Eq a) => [a] -> [a] -> Bool
isSubseqOf [] _ = True
isSubseqOf _ [] = False
isSubseqOf (x:xs) (y:ys) = case x == y of
  True  -> isSubseqOf xs ys
  False -> False

-- 2.
-- Split a sentence into words, then tuple each word with the capitalized form
-- of each.
capitalizeWords :: String -> [(String, String)]
capitalizeWords xs = map f $ words xs
  where
    f word@(y:ys) = (word, toUpper y : ys)

