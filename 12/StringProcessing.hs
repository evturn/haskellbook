module StringProcessing where

replaceThe :: String -> String
replaceThe xs = unwords $ map sayByeToThe (words xs)
  where
    sayByeToThe "the" = "a"
    sayByeToThe x     = x

testReplaceThe :: String
testReplaceThe = replaceThe "Man, this chocolate cake is the shit!"

vowels :: [Char]
vowels = ['a', 'e', 'i', 'o', 'u']

countTheBeforeVowel :: String -> Integer
countTheBeforeVowel = counter . words
  where
    counter (x1:x2:xs)
      | x1 == "the" && head x2 `elem` vowels = 1 + counter (x2:xs)
      | otherwise                            = 0 + counter (x2:xs)
    counter _ = 0

isVowel :: Char -> Bool
isVowel = (flip elem) vowels

counVowels :: String -> Integer
counVowels = fromIntegral . length . filter isVowel

main :: IO ()
main = print $ counVowels "Where are the oranges I left in the upper cabinet"