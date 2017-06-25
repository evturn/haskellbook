import Data.Char (toUpper)
import Data.List (intercalate)

isSubsequenceOf :: (Eq a) => [a] -> [a] -> Bool
isSubsequenceOf [] _ = True
isSubsequenceOf _ [] = False
isSubsequenceOf (x:xs) (y:ys) = case x == y of
  True  -> isSubsequenceOf xs ys
  False -> False

capitalizeWords :: String -> [(String, String)]
capitalizeWords xs = map f $ words xs
  where f word@(y:ys) = (word, toUpper y : ys)

capitalizeWord :: String -> String
capitalizeWord [] = []
capitalizeWord (x:xs) = toUpper x : xs

capitalizeParagraph :: String -> String
capitalizeParagraph xs = concatMap capitalizeWord $ groupBy ((==) `on` (=='.')) xs