-- 1.
-- Given the following set of consonants and vowels:
stops :: String
stops = "pbtdkg"

vowels :: String
vowels = "aeiou"

-- a)
-- Write a function that takes inputs from `stops` and `vowels` and makes
-- 3-tuples of all possible stop-vowel-stop combinations.
stopVowelStop :: [(Char, Char, Char)]
stopVowelStop = [(s, v, s') | s <- stops, v <- vowels, s' <- stops]

-- b)
-- Modify that function so that it only returns the combinations that
-- begin with a 'p'.
stopVowelStopP :: [(Char, Char, Char)]
stopVowelStopP = [(s, v, s') | s <- stops, v <- vowels, s' <- stops, s == 'p']

-- c)
-- Set up lists of nouns and verbs and modify the function to make tuples
-- representing possible noun-verb-noun sentences.
nouns :: [String]
nouns = [ "car"
        , "computer"
        , "shoe"
        , "refrigerator"
        ]

verbs :: [String]
verbs = [ "slap"
        , "slip"
        , "sleep"
        , "slam"
        ]

nounVerbNoun :: [(String, String, String)]
nounVerbNoun = [(n, v, n') | n <- nouns, v <- verbs, n' <- nouns]
