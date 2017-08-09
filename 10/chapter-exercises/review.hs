stops = "pbtdkg"
vowels = "aeiou"

nouns = ["grandmother", "train", "face", "crankshaft"]
verbs = ["snaggle", "shred", "slap", "oscilate"]

-- 1.
-- a)
stopVowelStop ss vs = [(s, v, s') | s <- ss, v <- vs, s' <- ss]

-- b)
stopVowelStop' ss vs = [(s, v, s') | s <- ss, v <- vs, s' <- ss, s == 'p' || s == 'p']

-- c)
nounVerbNoun ns vs = [(n, v, n') | n <- ns, v <- vs, n' <- ns]

-- 2.
-- A String
-- split into a list of the words
-- each word in the list mapped to the number of characters the word contains
-- all the numbers in the list added together
-- that total is then divided by the length of the list

-- total characters / total words

-- 3.
seekritFunc x =
  fromIntegral (sum $ map length $ words x) / fromIntegral (length $ words x)
