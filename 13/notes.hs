-- `do` notation

-- main = do
--       [1]

--  x1 <- getLine
-- [2] [3] [4]

--  x2 <- getLine
--         [5]

--  return (x1 ++ x2)
--   [6]      [7]

-- 1. `do` introduces the block of IO actions.

-- 2. `x1` is a variable representing the value obtained from the IO action `getLine`

-- 3. `<-` binds the variable on the left to the result of the IO action on the right.

-- 4. `getLine` has the type `IO String` and takes user input of a string value. In this case,
--    the string the user inputs will be the value bound to the `x1` name.

-- 5. `x2` is a variable representing the value obtained from our second `getLine`.

-- 6. `return` is the concludeing action of our `do` block.

-- 7. This is the value `return` returns. The conjunction of the two strings we obtained.