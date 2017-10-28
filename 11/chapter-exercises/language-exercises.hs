import Data.Char
import Data.List
import Data.List.Split

capitalizeWord :: String -> String
capitalizeWord [] = []
capitalizeWord (x:xs) = toUpper x : xs

capitalizeParagraph :: String -> String
capitalizeParagraph [] = []
capitalizeParagraph xs = joinAndConcat . splitAndCapitalize $ xs

splitAndCapitalize :: String -> [String]
splitAndCapitalize = fmap capitalizeWord . splitOn ". "

joinAndConcat :: [String] -> String
joinAndConcat xs = concatMap (\ys -> ys ++ ". ") (init xs) ++ (last xs)
