-- Source
-- z = 7
-- y = z + 8
-- x = y ^ 2
-- waxOn = x * 5

-- REPL safe

-- let z = 7
-- let y = z + 8
-- let x = y ^ 2
-- waxOn = x * 5

-- where clause
waxOn     = x * 5
  where z = 7
        y = z + 8
        x = y ^ 2

triple x = x * 3

waxOff x = triple x