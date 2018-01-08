module Main where

import           Control.Exception
import           Data.Typeable

handler :: SomeException -> IO ()
handler (SomeException e) = do
  putStrLn ("Running main caused an error! It was " ++ show e)
  writeFile "bbb" "hi"

main :: IO ()
main = do
  writeFile "zzz" "hi" `catch` handler
