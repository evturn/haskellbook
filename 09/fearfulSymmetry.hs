module PoemLines where

firstSen = "Here is a brand new basket\n"
secondSen = "Of golden retriever puppies\n"
thirdSen = "Made out of tin foil\n"
fourthSen = "That I want you to have"
sentences = firstSen ++ secondSen ++ thirdSen ++ fourthSen

myLines :: String -> [String]
myLines []        = []
myLines ('\n':xs) = myLines xs
myLines xs        = a : myLines b
  where
    a = takeWhile (/= '\n') xs
    b = dropWhile (/= '\n') xs


shouldEqual =
  [ "Here is a brand new basket"
  , "Of golden retriever puppies"
  , "Made out of tin foil"
  , "That I want you to have"
  ]

main :: IO ()
main =
  print $ "Are they equal? "
    ++ show (myLines sentences == shouldEqual)