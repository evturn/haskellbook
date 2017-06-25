module ValidateTheWord where

newtype Word' = Word' String
              deriving (Eq, Show)

vowels :: String
vowels = "aeiou"

countVowels :: String -> Integer
countVowels = fromIntegral . length . filter isVowel
  where
    isVowel = (flip elem) vowels

countConsonants :: String -> Integer
countConsonants = fromIntegral . length . filter (not . (flip elem) vowels)

mkWord :: String -> Maybe Word'
mkWord word
  | countVowels word > countConsonants word = Nothing
  | otherwise                               = Just (Word' word)


main :: IO ()
main = print $ mkWord "Shiiiiibooyah"