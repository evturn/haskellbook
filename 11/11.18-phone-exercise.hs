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

phone :: DaPhone
phone = DaPhone 
    [ ('1', "")
    , ('2', "ABC")
    , ('3', "DEF")
    , ('4', "GHI")
    , ('5', "JKL")
    , ('6', "MNO")
    , ('7', "PQRS")
    , ('8', "TUV")
    , ('9', "WXYZ")
    , ('*', "")
    , ('0', " ")
    , ('#', ".,") 
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

pressTillMatch :: Char -> Maybe Int
pressTillMatch c = fmap (+1) (elemIndex (toUpper c) $ snd $ locateKey c phone)

charToPresses :: Char -> Maybe Int -> Int
charToPresses c (Just n) = charCase c + n
charToPresses _ Nothing  = 0



reverseTaps :: DaPhone -> Char -> [(Digit, Presses)]
reverseTaps = undefined

cellPhonesDead :: DaPhone -> String -> [(Digit, Presses)]
cellPhonesDead = undefined

-- 3.
-- How many times do digits need to be pressed for each message?
fingerTaps :: [(Digit, Presses)] -> Presses
fingerTaps = undefined

-- 4.
-- What was the most popular letter for each message? 
-- Combine `reverseTaps` and `fingerTaps` to figure out what it cost in taps. 
-- `reverseTaps` is a list because you need to press a different button in 
--  order to get capitals.
mostPopularLetter :: String -> Char
mostPopularLetter = undefined

-- 5.
-- What was the most popular letter overall and the most popular word?
coolestLtr :: [String] -> Char
coolestLtr = undefined

coolestWord :: [String] -> String
coolestWord = undefined
