stops = "pbtdkg"
vowels = "aeiou"

nouns = ["grandmother", "train", "face", "crankshaft"]
verbs = ["snaggle", "shred", "slap", "oscilate"]

stopVowelStop xs ys = [(x, y, z) | x <- xs, y <- ys, z <- xs]

pStopVowelStop xs ys = [(x, y, z) | x <- xs, y <- ys, z <- xs, x == 'p']

seekritFunc x = fromIntegral (sum (map length (words x))) / fromIntegral (length (words x))


-- direct recursion, not using (&&)
andOne :: [Bool] -> Bool
andOne [] = True
andOne (x:xs) = if x == False then False else andOne xs

-- direct recursion, using (&&)
andTwo :: [Bool] -> Bool
andTwo [] = True
andTwo (x:xs) = x && andTwo xs

-- fold, not point-free in the folding function
andThree :: [Bool] -> Bool
andThree = foldr (\a b -> if a == False then False else b) True

-- fold, both function and folding function are point-free
andFour :: [Bool] -> Bool
andFour = foldr (&&) True


orOne :: [Bool] -> Bool
orOne [] = True
orOne (x:xs) = if x == True then True else orOne xs

orTwo :: [Bool] -> Bool
orTwo [] = True
orTwo (x:xs) = x (||) orTwo xs

orThree :: [Bool] -> Bool
orThree = foldr (\a b -> if a == True then True else b) False

orFour :: [Bool] -> Bool
orFour = foldr (||) False