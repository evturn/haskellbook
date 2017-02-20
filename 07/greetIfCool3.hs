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

data Employee = Coder
              | Manager
              | Veep
              | CEO
              deriving (Eq, Ord, Show)

reportBoss :: Employee -> Employee -> IO ()
reportBoss e e' = putStrLn $ show e ++ " is the boss of " ++ show e'

coderz5000 :: Employee -> Employee -> Ordering
coderz5000 Coder Coder = EQ
coderz5000 Coder _     = GT
coderz5000 _     Coder = LT
coderz5000 e e'        = compare e e'

employeeRank :: (Employee -> Employee -> Ordering)
              -> Employee
              -> Employee
              -> IO ()
employeeRank f e e' = case f e e' of
  GT -> reportBoss e e'
  EQ -> putStrLn "Neither employee is the boss"
  LT -> (flip reportBoss) e e'