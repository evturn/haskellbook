module Vigenere where

import           Cipher
import           System.Environment (getArgs)
import           System.IO          (hGetLine, hPutStr, stdin, stdout)

readIn :: String -> Int
readIn x = read x

parseArgs :: Int -> String -> String -> String
parseArgs k "-d" xs = uncaesar k xs
parseArgs k _    xs = caesar k xs

run :: IO ()
run = do
  (k:m:[]) <- getArgs
  putStrLn "Start typing."
  input <- hGetLine stdin
  putStrLn $ parseArgs (readIn k) m input

