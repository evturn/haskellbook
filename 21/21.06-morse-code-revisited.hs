import qualified Data.Map         as M
import           Data.Maybe
import           Data.Traversable as T

type Morse = String

morse :: String -> [Morse]
morse s = fromMaybe [] (stringToMorse s)

stringToMorse :: String -> Maybe [Morse]
stringToMorse = traverse charToMorse

morseToLetter :: M.Map Morse Char
morseToLetter = M.foldWithKey (flip M.insert) M.empty letterToMorse

charToMorse :: Char -> Maybe Morse
charToMorse c = M.lookup c letterToMorse

morseToChar :: Morse -> Maybe Char
morseToChar m = M.lookup m morseToLetter

letterToMorse :: (M.Map Char Morse)
letterToMorse = M.fromList [ ('a', ".-")
                           , ('b', "-...")
                           , ('c', "-.-.")
                           , ('d', "-..")
                           , ('e', ".")
                           , ('f', "..-.")
                           , ('g', "--.")
                           , ('h', "....")
                           , ('i', "..")
                           , ('j', ".---")
                           , ('k', "-.-")
                           , ('l', ".-..")
                           , ('m', "--")
                           , ('n', "-.")
                           , ('o', "---")
                           , ('p', ".--.")
                           , ('q', "--.-")
                           , ('r', ".-.")
                           , ('s', "...")
                           , ('t', "-")
                           , ('u', "..-")
                           , ('v', "...-")
                           , ('w', ".--")
                           , ('x', "-..-")
                           , ('y', "-.--")
                           , ('z', "--..")
                           , ('1', ".----")
                           , ('2', "..---")
                           , ('3', "...--")
                           , ('4', "....-")
                           , ('5', ".....")
                           , ('6', "-....")
                           , ('7', "--...")
                           , ('8', "---..")
                           , ('9', "----.")
                           , ('0', "-----")
                           ]
