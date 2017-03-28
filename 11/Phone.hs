-- -----------------------------------------
-- |   1        |    2 ABC    |   3 DEF    |
-- _________________________________________
-- |   4 GHI    |    5 JKL    |   6 MNO    |
-- -----------------------------------------
-- |   7 PQRS   |    8 TUV    |   9 WXYZ   |
-- -----------------------------------------
-- |   * ^      |    0 + _    |   # .,     |
-- -----------------------------------------

-- 2     -> 'A'
-- 22    -> 'B'
-- 222   -> 'C'
-- 2222  -> '2'
-- 22222 -> 'A'

type Digit = Char
type PressCount = Int


data Button = One | Two | Three | Four
            | Five | Six | Seven | Eight
            | Nine | Star | Zero | Pound
            deriving (Eq, Show)

button :: Button -> (Digit, String)
button a
  | a == One   = ('1', "1")
  | a == Two   = ('2', "ABC")
  | a == Three = ('3', "DEF")
  | a == Four  = ('4', "GHI")
  | a == Five  = ('5', "JKL")
  | a == Six   = ('6', "MNO")
  | a == Seven = ('7', "PQRS")
  | a == Eight = ('8', "TUV")
  | a == Nine  = ('9', "WXYZ")
  | a == Star  = ('*', "*^")
  | a == Zero  = ('0', "+_")
  | a == Pound = ('#', ".,")
  | otherwise  = button Zero


data TextEntry = Selection (Button, PressCount) deriving (Eq, Show)
data Keypad = Keypad [Button] deriving (Eq, Show)

convo :: [String]
convo =
   ["Wanna play a 36 hour game of tackle football",
    "I definitely do",
    "Ok, great",
    "Wait, can we used spiked bats?",
    "Of course, you don't have to ask",
    "Do I need to wear goggles though?",
    "Are you for real?",
    "Yes",
    "It's called football, so yes, definitely wear googgles."]

-- reverseTaps :: Keypad -> Char -> [TextEntry]
-- reverseTaps = undefined