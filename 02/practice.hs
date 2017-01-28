mult1     = x * y
  where x = 5
        y = 6

-- 1.
--    let x = 3
--    y = 1000 in x * 3 + y
-- 2.
--    let y = 10
--    x = 10 * 5 + y in x * 5
-- 3.
--    let x = 7
--    y = negate x
--    z = y * 10 in z / x + y

one       = x * 3 + y
  where x = 3
        y = 1000

two       = x * 5
  where y = 10
        x = 10 * 5 + y

three     = z / x + y
  where x = 7
        y = negate x
        z = y * 10