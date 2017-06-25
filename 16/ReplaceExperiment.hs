module ReplaceExperiment where

replaceWithP :: b -> Char
replaceWithP = const 'p'

lms :: [Maybe [Char]]
lms = [Just "Ave", Nothing, Just "sure dude."]

replaceWithP' :: [Maybe [Char]] -> Char
replaceWithP' = replaceWithP

liftedReplace :: Functor f => f a -> f Char
liftedReplace = fmap replaceWithP

liftedReplace' :: [Maybe [Char]] -> [Char]
liftedReplace' = liftedReplace

twiceLifted :: (Functor f1, Functor f) =>
               f (f1 a) -> f (f1 Char)
twiceLifted = (fmap . fmap) replaceWithP

twiceLifted' :: [Maybe [Char]] -> [Maybe Char]
twiceLifted' = twiceLifted

thriceLifted :: (Functor f2, Functor f1, Functor f) =>
                f (f1 (f2 a)) -> f (f1 (f2 Char))
thriceLifted = (fmap . fmap . fmap) replaceWithP

thriceLifted' :: [Maybe [Char]] -> [Maybe [Char]]
thriceLifted' = thriceLifted

main :: IO ()
main = do
  putStr "replaceWithP' lms:   "
  print (replaceWithP' lms)
-- replaceWithP' lms:   'p'

  putStr "liftedReplace lms:   "
  print (liftedReplace lms)
-- liftedReplace lms:   "ppp"

  putStr "liftedReplace' lms:  "
  print (liftedReplace lms)
-- liftedReplace' lms:  "ppp"

  putStr "twiceLifted lms:     "
  print (twiceLifted lms)
-- twiceLifted lms:     [Just 'p',Nothing,Just 'p']

  putStr "twiceLifted' lms:    "
  print (twiceLifted' lms)
-- twiceLifted' lms:    [Just 'p',Nothing,Just 'p']

  putStr "thriceLifted lms:    "
  print (thriceLifted lms)
-- thriceLifted lms:    [Just "ppp",Nothing,Just "pppppppppp"]

  putStr "thriceLifted' lms:   "
  print (thriceLifted' lms)
-- thriceLifted' lms:   [Just "ppp",Nothing,Just "pppppppppp"]

