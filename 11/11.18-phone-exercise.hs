import Data.Char
import Data.List

-- Translate sequences of button presses into strings and vice versa.
--
-- -----------------------------------------
-- |   1        |    2 ABC    |   3 DEF    |
-- _________________________________________
-- |   4 GHI    |    5 JKL    |   6 MNO    |
-- -----------------------------------------
-- |   7 PQRS   |    8 TUV    |   9 WXYZ   |
-- -----------------------------------------
-- |   * ^      |    0 + _    |   # .,     |
-- -----------------------------------------
--
-- * gives you capitalization of the letter. 
-- 0 is spacebar.
-- Pressing a button one more than the letters it represents.
-- Pressing a button once more after the digit wraps back to the first letter.

-- 1.
-- Create a data structure that captures the phone layout and behavior.
keypadDigits :: [String]
keypadDigits = [ ['0'..'9'] 
               , ['*']
               , ['#']
               ]

keypadChars :: [String]
keypadChars = [ ['a'..'z']
              , ['A'..'Z']
              , ['0'..'9']
              , [' ']
              , ['.', ',']
              ]

type Digit   = Char
type Presses = Int

data DaPhone = DaPhone [(Digit, String)]
  deriving (Eq, Show)

digits :: String
digits = foldl (++) [] keypadDigits

chars :: String
chars = foldl (++) [] keypadChars

allChars :: String
allChars = digits ++ chars

phone :: DaPhone
phone = DaPhone 
    [ ('1', "1")
    , ('2', "ABC2")
    , ('3', "DEF3")
    , ('4', "GHI4")
    , ('5', "JKL5")
    , ('6', "MNO6")
    , ('7', "PQRS7")
    , ('8', "TUV8")
    , ('9', "WXYZ9")
    , ('*', "^*")
    , ('0', " +0")
    , ('#', ".,#") 
    ]

-- 2.
-- Convert the conversations into keypresses required to express them.
convo :: [String]
convo = [ "Wanna play 20 questions"
        , "Ya"
        , "U 1st haha"
        , "Lol ok. Have u ever tasted alcohol"
        , "Lol ya"
        , "Wow ur cool haha. Ur turn"
        , "Ok. Do u think I am preety Lol"
        , "Lol ya"
        , "Just making sure rofl ur turn"
        ]

charCase :: Char -> Int
charCase c = if isUpper c
             then 1
             else 0

charAtKey :: Char -> String -> Bool
charAtKey x xs = elem (toUpper x) xs

locateKey :: Char -> DaPhone -> (Digit, String)
locateKey c (DaPhone keys) = head [(d, chs) | (d, chs) <- keys, charAtKey c chs]

pressesTillMatch :: Char -> Maybe Int
pressesTillMatch c = fmap (+1) (elemIndex (toUpper c) $ snd $ locateKey c phone)

charToPresses :: Char -> Maybe Int -> Int
charToPresses c (Just n) = charCase c + n
charToPresses _ Nothing  = 0

charPresses :: Char -> Int
charPresses c = charToPresses c $ pressesTillMatch c

accumulateCharPresses :: Int -> Char -> Int
accumulateCharPresses x y = x + charPresses y

pressesPerMessage :: String -> Int
pressesPerMessage = foldl accumulateCharPresses 0

pressesPerConvo :: [String] -> Int
pressesPerConvo [] = 0
pressesPerConvo xs = foldl combinePresses 0 xs
  where
    combinePresses = (\x y -> x + pressesPerMessage y)

-- 3.
-- How many times do digits need to be pressed for each message?
listOfCharPresses :: String -> [Int]
listOfCharPresses = foldl (\x y -> charPresses y : x) []

-- 4.
-- What was the most popular letter for each message? 
mostPopularLetter :: String -> Char
mostPopularLetter xs = fst $ foldl compareCount (' ', 0) $ breakUp xs
  where
    breakUp xs = occurencesByChar $ filter isAlphaNum xs
    compareCount = (\x y -> if snd x <= snd y
                            then y
                            else x)

occurencesByChar :: String -> [(Char, Int)]
occurencesByChar xs = [(x, (length . filter (==x)) xs) | x <- allChars]
-- 5.
-- What was the most popular letter overall and the most popular word?
coolestLtr :: [String] -> Char
coolestLtr = undefined

coolestWord :: [String] -> String
coolestWord = undefined
