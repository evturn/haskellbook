import Control.Monad
import System.Exit (exitSuccess)
import Data.Char (isAlphaNum, toLower)

normalizeString :: String -> String
normalizeString = map toLower . filter isAlphaNum

checkSentence :: String -> Bool
checkSentence s = (normalizeString s) == (reverse $ normalizeString s)

palindrome :: IO ()
palindrome = forever $ do
  line1 <- getLine
  if checkSentence line1
  then do putStrLn "It's a palindrome"
          return ()
  else do putStrLn "Nah"
          putStrLn "Not that one."
          putStrLn "We're leaving, bye."
          putStrLn ""
          putStrLn "(The following Exception is not real.)"
          exitSuccess