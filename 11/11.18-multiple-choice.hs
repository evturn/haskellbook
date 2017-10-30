-- 1.
data Weekday = Monday
             | Tuesday
             | Wednesday
             | Thursday
             | Friday
-- Answer:
-- a) Weekday is a type with five data constructors.

-- 2.
-- What is the type of the function `f`?
f Friday = "Miller Time"
-- Answer:
-- c) f :: Weekday -> String

-- 3.
-- Types defined with the `data` keyword
-- Answer:
-- b) must begin with a capital letter

-- 4.
g xs = xs !! (length xs - 1)
-- Answer:
-- d) delivers the final element of `xs`
