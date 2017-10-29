import Data.Char
import Data.List
import Data.List.Split

-- 1.
-- Write a function that capitalizes a word.
capitalizeWord :: String -> String
capitalizeWord [] = []
capitalizeWord (x:xs) = toUpper x : xs

-- 2.
-- Write a function that captializes sentences in a paragraph. Reuse the
-- `capitalizeWord` function.
capitalizeParagraph :: String -> String
capitalizeParagraph [] = []
capitalizeParagraph xs = joinAndConcat . splitAndCapitalize $ xs

splitAndCapitalize :: String -> [String]
splitAndCapitalize = fmap capitalizeWord . splitOn ". "

joinAndConcat :: [String] -> String
joinAndConcat xs = concatMap (\ys -> ys ++ ". ") (init xs) ++ (last xs)
