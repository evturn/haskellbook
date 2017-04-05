replaceThe :: String -> String
replaceThe xs = unwords $ map sayByeToThe (words xs)
  where
    sayByeToThe "the" = "a"
    sayByeToThe x     = x