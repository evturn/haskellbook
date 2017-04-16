module Main where

import DogsRule
import Hello
import System.IO

main :: IO ()
main = do
  hSetBuffering stdout NoBuffering
  putStr "And your name is?       -> "
  name <- getLine
  sayHello name
  dogs