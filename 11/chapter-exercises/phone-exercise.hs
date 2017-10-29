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
data DaPhone = DaPhone

-- 2.
-- Convert the conversations into keypresses required to express them.
convo :: [String]
convo = [
          "Wanna play 20 questions"
        , "Ya"
        , "U 1st haha"
        , "Lol ok. Have u ever tasted alcohol"
        , "Lol ya"
        , "Wow ur cool haha. Ur turn"
        , "Ok. Do u think I am preety Lol"
        , "Lol ya"
        , "Just making sure rofl ur turn"
        ]

type Digit = Char
type Presses = Int

reverseTaps :: DaPhone -> Char -> [(Digit, Presses)]
reverseTaps = undefined

cellPhonesDead :: DaPhone -> String -> [(Digit, Press)]
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
-- What was the most popular letter overall and the most populat word?
coolestLtr :: [String] -> Char
coolestLtr = undefined

coolestWord :: [String] -> String
coolestWord = undefined
