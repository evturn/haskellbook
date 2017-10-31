import Data.Char

-- Translate sequences of button presses into strings and vice versa.
--
-- * gives you capitalization of the letter. 
-- 0 is spacebar.
-- Pressing a button one more than the letters it represents.
-- Pressing a button once more after the digit wraps back to the first letter.
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

-- 1.
-- Create a data structure that captures the phone layout and behavior.
type Digit   = Char
type Presses = Int

data Button = Button (Digit, [Digit])
  deriving (Eq, Show)

data Keypad = Keypad [Button]
  deriving (Eq, Show)

buttonDigits :: String
buttonDigits = ['0'..'9'] ++ "*#"

buttonChars :: String
buttonChars = ['a'..'z'] ++ ['A'..'Z'] ++ ['0'..'9'] ++ " ."

phoneKeypad :: [Button]

phoneKeypad = [ Button ('1', "1")
              , Button ('2', "ABC")
              , Button ('3', "DEF")
              , Button ('4', "GHI")
              , Button ('5', "JKL")
              , Button ('6', "MNO")
              , Button ('7', "PQRS")
              , Button ('8', "TUV")
              , Button ('9', "WXYZ")
              , Button ('*', "")
              , Button ('0', " ")
              , Button ('#', ".," ) 
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


reverseTaps :: DaPhone -> Char -> [(Digit, Presses)]
reverseTaps = undefined

cellPhonesDead :: DaPhone -> String -> [(Digit, Presses)]
cellPhonesDead = undefined

-- 3.
-- How many times do digits need to be pressed for each message?
fingerTaps :: [(Digit, Presses)] -> Presses
fingerTaps = undefined

-- 4.
-- What was the most popular letter for each message? Combine `reverseTaps`
-- and `fingerTaps` to figure out what it cost in taps. `reverseTaps` is a
-- list because you need to press a different button in order to get capitals.
mostPopularLetter :: String -> Char
mostPopularLetter = undefined

-- 5.
-- What was the most popular letter overall and the most popular word?
coolestLtr :: [String] -> Char
coolestLtr = undefined

coolestWord :: [String] -> String
coolestWord = undefined

testChar :: Char -> String -> Bool
testChar c s = elem (toUpper c) s

charInButtonChars :: Char -> Button -> [Char]
charInButtonChars char (Button (d, c)) = if testChar char c then [d] else []

matchButton :: [Button] -> Char -> [Char]
matchButton [] _ = ['0']
matchButton (x:xs) c = (charInButtonChars c x) ++ (matchButton xs c)

reverseTaps :: [Button] -> Char -> [(Digit, Presses)]
reverseTaps keypad char = [((head $ matchButton keypad char), 2)]
