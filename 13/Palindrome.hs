import Control.Monad
import System.Exit (exitSuccess)

palindrome :: IO ()
palindrome = forever $ do
  line1 <- getLine
  if line1 == reverse line1
  then do putStrLn "It's a palindrome"
          return ()
  else do putStrLn "Nah"
          putStrLn "Not that one."
          putStrLn "We're leaving, bye."
          putStrLn ""
          putStrLn "(The following Exception is not real.)"
          exitSuccess