module TupleFunctions where

addEmUp2 :: Num a => (a, a) -> a
addEmUp2 (x, y) = x + y

addEmUp2Alt :: Num a => (a, a) -> a
addEmUp2Alt tup = (fst tup) + (snd tup)

fst3 :: (a, b, c) -> a
fst3 (x, _, _) = x

third3 :: (a, b, c) -> c
third3 (_, _, x) = x

f :: (a, b, c) -> (d, e, f) -> ((a, d), (c, f))
f (x1, _, y1) (x2, _, y2) = ((x1, x2), (y1, y2))