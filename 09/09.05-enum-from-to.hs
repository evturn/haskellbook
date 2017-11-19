eftBool :: Bool -> Bool -> [Bool]
eftBool True False  = []
eftBool True True   = [True]
eftBool False True  = [False, True]
eftBool False False = [False]

eftOrd :: Ordering -> Ordering -> [Ordering]
eftOrd LT LT = [LT]
eftOrd LT EQ = [LT, EQ]
eftOrd LT GT = [LT, EQ, GT]
eftOrd EQ EQ = [EQ]
eftOrd EQ GT = [EQ, GT]
eftOrd GT GT = [GT]
eftOrd _  _  = []

eftInt :: Int -> Int -> [Int]
eftInt x y | x > y     = []
           | x == y    = [x]
           | otherwise = [x] ++ (eftInt (x + 1) y)

eftChar :: Char -> Char -> [Char]
eftChar x y | x > y     = []
            | x == y    = [x]
            | otherwise = [x] ++ eftChar (succ x) y
