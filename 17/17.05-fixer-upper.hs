-- Use `(<$>)` from `Functor`, `(<*>)` and `pure` from `Applicative` to fill
-- in missing bits of the broken code to make it work.
--
-----------------------------------------------------------------------------
-- 1.
f1 :: Maybe String
f1 = const <$> Just "Hello" <*> pure "World"

-- 2.
f2 :: Maybe (Int, Int, String, [Int])
f2 = (,,,) <$> Just 90 <*> Just 10 <*> Just "Tierness" <*> pure [1, 2, 3]
