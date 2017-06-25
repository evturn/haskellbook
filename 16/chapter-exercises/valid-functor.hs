import GHC.Arr

-- 1.
data Bool = False | True
-- No
-- kind *

-- 2.
data BoolAndSomethingElse a = False' a | True' a
-- Yes

-- 3.
data BoolAndMaybeSomethingElse a = Falsish | Truish a
-- Yes

-- 4.
newtype Mu f = InF { outF :: F (Mu f) }
-- Yes

-- 5.
data D = D (Array Word Word) Int Int
-- No
-- not a * → *