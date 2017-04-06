module StringProcessing where

replaceThe :: String -> String
replaceThe xs = unwords $ map sayByeToThe (words xs)
  where
    sayByeToThe "the" = "a"
    sayByeToThe x     = x

runTest :: String
runTest = replaceThe "Man, this chocolate cake is the shit!"

main :: IO ()
main = print $ runTest