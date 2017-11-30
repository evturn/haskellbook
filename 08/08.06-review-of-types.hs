-- 1.
-- What is the type of [[True, False], [True, True], [False, True]] ?
--
-- Answer:
-- d) [[Bool]]

-----------------------------------------------------------------------------
-- 2.
-- Which of the following has the same type as
-- [[True, False], [True, True], [False, True]] ?
--
-- Answer:
-- b) [[3 == 3], [6 > 5], [3 < 4]]

-----------------------------------------------------------------------------
-- 3.
-- Which is true about the following function?
func :: [a] -> [a] -> [a]
func x y = x ++ y
-- Answer:
-- d) all of the above

-----------------------------------------------------------------------------
-- 4.
-- For the `func` code above, which is a valid application of `func` to bot
-- its arguments?
--
-- Answer:
-- b) func "Hello" "World"
