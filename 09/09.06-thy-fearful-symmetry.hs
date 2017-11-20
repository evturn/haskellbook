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

main :: IO ()
main = print $ "Are they equal? " ++ show (myLines sentences == shouldEqual)
