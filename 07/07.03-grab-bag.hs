-- 1.
-- Which (two or more) of the following are equivalent?
--
-- Answer:
-- All choices.

-----------------------------------------------------------------------------
-- 2.
-- The type of `mTh` is `Num a => a -> a -> a -> a`.
-- Which is the type of `mTh 3`?
--
-- Answer:
-- d) Num a => a -> a -> a

-----------------------------------------------------------------------------
-- 3.
-- a) Rewrite the `f` function in the where clause.
addOneIfOdd n = case odd n of
                  True  -> f n
                  False -> n
                  where
                    f = (+1)

-- b) Rewrite the following to use anonymous lambda syntax.
addFive = \x -> \y -> (if x > y then y else x) + 5

-- c) Rewrite the following so that it doesn't use anonymous lambda syntax.
mflip f x y = f y x
