data Trivial =
  Trivial'

instance Eq Trivial where
  Trivial' == Trivial' = True

--      instance Eq Trivial where
--         [1]   [2]  [3]    [4]
--
--        Trivial' == Trivial' = True
--          [5]   [6]   [7]      [8]
--
-- 1. The keyword `instance` here begins a declaration of a typeclass instance.
-- 2. The first name to follow the instance is the typeclass the instance is providing.
-- 3. The type the instance is being provided for. `Eq` typeclass for the `Trivial` datatype.
-- 4. The keyword `where` terminates the initial declaration followed by the functions being implemented.
-- 5. The data constructor (value) `Trivial'` is the first argument to the `==` function we’re providing.
-- 6. The infix function `==` is what we are defining in this declaration.
-- 7. The value `Trivial'`
-- 8. The result of `Trivial' == Trivial'`, `True`.