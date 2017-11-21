module PoemLines where

-----------------------------------------------------------------------------
-- 1.
-- Using `takeWhile` and `dropWhile`, write a function that takes a string and
-- returns a list of strings, using spaces to separate the elements of the
-- string into words.
myWords :: String -> [String]
myWords []       = []
myWords (' ':xs) = myWords xs
myWords xs       = takeWhile (/=' ') xs : (myWords $ dropWhile (/=' ') xs)

-----------------------------------------------------------------------------
-- 2.
firstSen  = "Tyger Tyger, burning bright\n"
secondSen = "In the forest of the night\n"
thirdSen  = "What immortal hand or eye\n"
fourthSen = "Could frame thy fearful symmetry?"
sentences = firstSen ++ secondSen ++ thirdSen ++ fourthSen

myLines :: String -> [String]
myLines []        = []
myLines ('\n':xs) = myLines xs
myLines xs        = takeWhile (/='\n') xs : (myLines $ dropWhile (/='\n') xs)

shouldEqual :: [String]
shouldEqual = [ "Tyger Tyger, burning bright"
              , "In the forest of the night"
              , "What immortal hand or eye"
              , "Could frame thy fearful symmetry?"
              ]

-----------------------------------------------------------------------------
-- 3.
breakOnChar :: Char -> String -> [String]
breakOnChar c []     = []
breakOnChar c (x:xs) = if c == x then breakOnChar c xs else breakOnChar c (x:xs)
breakOnChar c xs     = takeWhile (/=c) xs : (breakOnChar c $ dropWhile (/=c) xs)

myWords' :: String -> [String]
myWords' xs = breakOnChar ' ' xs

myLines' :: String -> [String]
myLines' xs = breakOnChar '\n' xs

main :: IO ()
main = print $ "Are they equal? " ++ show (myLines sentences == shouldEqual)
