module Vigenere where

import           Cipher
import           System.Environment (getArgs)
import           System.Exit
import           System.IO          (hGetLine, hPutStr, hWaitForInput, stderr,
                                     stdin, stdout)

readIn :: String -> Int
readIn x = read x

parseArgs :: Int -> String -> String -> String
parseArgs k "-d" xs = uncaesar k xs
parseArgs k _    xs = caesar k xs

finishWithError :: IO a
finishWithError = do
  hPutStr stderr "Timed out"
  exitWith (ExitFailure 1)

run :: IO ()
run = do
  (k:m:[]) <- getArgs
  putStrLn "Start typing."
  success <- hWaitForInput stdin (5000)
  input <- case success of
    False -> finishWithError
    True  -> hGetLine stdin
  putStrLn $ parseArgs (readIn k) m input

