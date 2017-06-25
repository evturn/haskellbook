module GreetIfCool3 where

greetIfCool :: String -> IO ()
greetIfCool coolness = case cool of
  True -> putStrLn "Ok dude, what?"
  False -> putStrLn "I will murder this birthday cake and then murder you."
  where cool = coolness == "Shut up."


-- functionC x y = if (x > y) then x else y
functionC x y = case shit of
  True -> x
  False -> y
  where shit = x > y

-- ifEvenAdd2 n = if even n then (n+2) else n
ifEvenAdd2 n = case okayDude of
  True -> n + 2
  False -> n
  where okayDude = even n

nums x = case compare x 0 of
  LT -> -1
  GT -> 1
  EQ -> 0