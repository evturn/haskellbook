module Hello
  ( sayHello )
  where

sayHello :: String -> IO ()
sayHello name = putStrLn ("Sup " ++ name ++ "!")