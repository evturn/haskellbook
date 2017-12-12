import           Debug.Trace (trace)

inc :: Integer -> Integer
inc = (+1)

twice :: Integer -> Integer
twice = inc . inc

howManyTimes :: Integer
howManyTimes = inc (trace "I got eval'd" (1 + 1))
                 + twice
                   (trace "I got eval'd" (1 + 1))

howManyTimes' :: Integer
howManyTimes' = let onePlusOne = trace "I got eval'd" (1 + 1)
                 in inc onePlusOne + twice onePlusOne
