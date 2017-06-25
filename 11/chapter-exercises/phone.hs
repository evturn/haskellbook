import Data.Char (isUpper, toLower, toUpper)

type Digit      = Char
type PressCount = Int

data Button = Button (Digit, String)
            deriving (Eq, Show)

data Keypad = Keypad [Button]
            deriving (Eq, Show)

-- -----------------------------------------
-- |   1        |    2 ABC    |   3 DEF    |
-- _________________________________________
-- |   4 GHI    |    5 JKL    |   6 MNO    |
-- -----------------------------------------
-- |   7 PQRS   |    8 TUV    |   9 WXYZ   |
-- -----------------------------------------
-- |   * ^      |    0 + _    |   # .,     |
-- -----------------------------------------

buttonDigits :: String
buttonDigits = ['0'..'9'] ++ "*#"

buttonChars :: String
buttonChars = ['a'..'z'] ++ ['A'..'Z'] ++ ['0'..'9'] ++ " ."

phoneKeypad :: [Button]
phoneKeypad =
  [ Button ('1', "1"),    Button ('2', "ABC"), Button ('3', "DEF"),
    Button ('4', "GHI"),  Button ('5', "JKL"), Button ('6', "MNO"),
    Button ('7', "PQRS"), Button ('8', "TUV"), Button ('9', "WXYZ"),
    Button ('*', ""),     Button ('0', " "),   Button ('#', ".," ) ]

-- 2     -> 'A'
-- 22    -> 'B'
-- 222   -> 'C'
-- 2222  -> '2'
-- 22222 -> 'A'

convo :: [String]
convo =
  ["We shoild play a 36 hour game of tackle football",
    "We definitely should",
    "Ok great",
    "I will bring a spiked bat",
    "Remember to wear a batman costume",
    "Obviously",
    "Please remember",
    "Remember the Alamo",
    "Remember to keep all personal and carry on items with you at all times"]

testChar :: Char -> String -> Bool
testChar c s = elem (toUpper c) s

charInButtonChars :: Char -> Button -> [Char]
charInButtonChars char (Button (d, c)) = if testChar char c then [d] else []

matchButton :: [Button] -> Char -> [Char]
matchButton [] _ = ['0']
matchButton (x:xs) c = (charInButtonChars c x) ++ (matchButton xs c)

reverseTaps :: [Button] -> Char -> [(Digit, PressCount)]
reverseTaps keypad char = [((head $ matchButton keypad char), 2)]