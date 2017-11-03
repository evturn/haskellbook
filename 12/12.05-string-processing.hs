import Data.Char

-- 1.
-- Write a recursive function which takes text, breaks it into words and
-- replaces each instance of "the" with "a".
notThe :: String -> Maybe String
notThe xs = if xs == "the"
            then Nothing
            else Just xs

swapOutThe :: Maybe String -> String
swapOutThe Nothing   = "a"
swapOutThe (Just xs) = xs

replaceThe :: String -> String
replaceThe xs = unwords $ (fmap swapOutThe) $ (fmap notThe) (words xs)

-- 2.
-- Write a recursive function that takes text, breaks it into words, and
-- counts the number of instance of "the" followed by a vowel-inital word.
wordsToMaybes :: String -> [Maybe String]
wordsToMaybes xs = fmap notThe $ words xs

countTheBeforeVowel :: String -> Integer
countTheBeforeVowel str = doIt (wordsToMaybes str)
  where
    doIt []                      = 0
    doIt [_]                     = 0
    doIt (Just _ : _ : xs)       = doIt xs
    doIt (Nothing : Just x : xs) = if elem (head x) "aeiou"
                                   then 1 + doIt xs
                                   else doIt xs
