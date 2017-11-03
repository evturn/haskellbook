-- Use the `Maybe` type to write a function that counts the number of
-- vowels in a string and the number of consonants. If the number of vowels
-- exceeds the number of consonants, the function returns `Nothing`.
newtype Word' = Word' String
  deriving (Eq, Show)

vowels :: String
vowels = "aeiou"

vowelConsonantCounter :: (Int, Int) -> Char -> (Int, Int)
vowelConsonantCounter (v, c) x = if elem x "aeiou"
                                 then (v + 1, c)
                                 else (v, c + 1)

getSums :: String -> (Int, Int)
getSums = foldl vowelConsonantCounter (0, 0)

mkWord :: String -> Maybe Word'
mkWord xs
    | (fst $ getSums xs) <= (snd $ getSums xs) = Just (Word' xs)
    | otherwise                                = Nothing
