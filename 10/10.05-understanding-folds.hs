-- 1.
foldr (*) 1 [1..5]
-- will return the same result as:
--
-- Answer:
-- c) foldl (*) [1..5]

-- 2.
-- Write out the evaluation steps for:
foldl (flip (*)) 1 [1..3]
--
-- Answer:
-- ((1 * 1) * 2) * 3

-- 3.
-- One difference between `foldr` and `foldl` is:
-- Answer:
-- c) `foldr`, but not `foldl`, associates to the right

-- 4.
-- Folds are catamorphisms, which means they are generally used to:
-- Answer:
-- a) reduce structure

-- 5.
-- Fix the following:
-- a) foldr (++) ["woot", "WOOT", "woot"]
foldr (++) [] ["woot", "WOOT", "woot"]
-- b) foldr max [] "fear is the little death"
foldr max (minBound :: Char) "fear is the little death"
-- c) foldr and True [False, True]
foldr (&&) True [False, True]
-- d) foldr (||) True [False, True]
foldr (||) False [False, True]
-- e) foldl ((++) . show) "" [1..5]
foldl (flip ((++) . show)) "" [1..5]
-- f) foldr const 'a' [1..5]
foldr (flip const) 'a' [1..5]
-- g) foldr const 0 "tacos"
foldr (flip const) 0 "tacos"
-- h) foldl (flip const) 0 "burritos"
foldl const 0 "burritos"
-- i) foldl (flip const) 'z' [1..5]
foldl const 'z' [1..5]
