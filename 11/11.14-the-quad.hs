data Quantum =
    Yes
  | No
  | Both
  deriving (Eq, Show)

quantSum1 :: Either Quantum Quantum
quantSum1 = Right Yes

quantSum2 :: Either Quantum Quantum
quantSum2 = Right No

quantSum3 :: Either Quantum Quantum
quantSum3 = Right Both

quantSum4 :: Either Quantum Quantum
quantSum4 = Left Yes

quantSum5 :: Either Quantum Quantum
quantSum5 = Left No

quantSum6 :: Either Quantum Quantum
quantSum6 = Left Both


quantProd1 :: (Quantum, Quantum)
quantProd1 = (Yes, Yes)

quantProd2 :: (Quantum, Quantum)
quantProd2 = (Yes, No)

quantProd3 :: (Quantum, Quantum)
quantProd3 = (Yes, Both)

quantProd4 :: (Quantum, Quantum)
quantProd4 = (No, Yes)

quantProd5 :: (Quantum, Quantum)
quantProd5 = (No, No)

quantProd6 :: (Quantum, Quantum)
quantProd6 = (No, Both)

quantProd7 :: (Quantum, Quantum)
quantProd7 = (Both, Yes)

quantProd8 :: (Quantum, Quantum)
quantProd8 = (Both, No)

quantProd9 :: (Quantum, Quantum)
quantProd9 = (Both, Both)

quantFlip1 :: Quantum -> Quantum
quantFlip1 Yes  = Yes
quantFlip1 No   = Yes
quantFlip1 Both = Yes

quantFlip2 :: Quantum -> Quantum
quantFlip2 Yes  = Yes
quantFlip2 No   = Yes
quantFlip2 Both = No

quantFlip3 :: Quantum -> Quantum
quantFlip3 Yes  = Yes
quantFlip3 No   = Yes
quantFlip3 Both = Both

quantFlip4 :: Quantum -> Quantum
quantFlip4 Yes  = Yes
quantFlip4 No   = No
quantFlip4 Both = Yes

quantFlip5 :: Quantum -> Quantum
quantFlip5 Yes  = Yes
quantFlip5 No   = Both
quantFlip5 Both = Yes

quantFlip6 :: Quantum -> Quantum
quantFlip6 Yes  = No
quantFlip6 No   = Yes
quantFlip6 Both = Yes

quantFlip7 :: Quantum -> Quantum
quantFlip7 Yes  = Both
quantFlip7 No   = Yes
quantFlip7 Both = Yes

quantFlip8 :: Quantum -> Quantum
quantFlip8 Yes  = Both
quantFlip8 No   = Yes
quantFlip8 Both = No

quantFlip9 :: Quantum -> Quantum
quantFlip9 Yes  = Both
quantFlip9 No   = No
quantFlip9 Both = No

quantFlip10 :: Quantum -> Quantum
quantFlip10 Yes  = Both
quantFlip10 No   = No
quantFlip10 Both = Both

quantFlip11 :: Quantum -> Quantum
quantFlip11 Yes  = Both
quantFlip11 No   = Both
quantFlip11 Both = Both

quantFlip12 :: Quantum -> Quantum
quantFlip12 Yes  = No
quantFlip12 No   = No
quantFlip12 Both = No

convert :: Quantum -> Bool
convert = undefined

-- 1
convert Yes  = False
convert No   = False
convert Both = False

-- 2
convert Yes  = False
convert No   = False
convert Both = True

-- 3
convert Yes  = False
convert No   = True
convert Both = False

-- 4
convert Yes  = True
convert No   = False
convert Both = False

-- 5
convert Yes  = False
convert No   = True
convert Both = True

-- 6
convert Yes  = True
convert No   = False
convert Both = True

-- 7
convert Yes  = True
convert No   = True
convert Both = False

-- 8
convert Yes  = True
convert No   = True
convert Both = True

data Quad =
    One
  | Two
  | Three
  | Four
  deriving (Eq, Show)

eQuad :: Either Quad Quad
-- 4 + 4
-- 8 different forms

prodQuad :: (Quad, Quad)
-- 4 * 4
-- 16 different forms

funcQuad :: Quad -> Quad
-- 4 ^ 4
-- 256 different forms

funcTBool :: (Bool, Bool, Bool)
-- 2 * 2 * 2
-- 8 different forms

gTwo :: Bool -> Bool -> Bool
-- (2 ^ 2) ^ 2
-- 2 ^ (2 * 2)
-- 8 different forms

fTwo :: Bool -> Quad -> Quad
-- (4 ^ 4) ^ 2
-- 4 ^ (4 * 2)
-- 65536 different forms

-----------------------------------------------------------------------------
--
-- Deconstructing values
--
-----------------------------------------------------------------------------
newtype Name = Name String
  deriving Show

newtype Acres = Acres Int 
  deriving Show

data FarmerType = DairyFarmer
                | WheatFarmer
                | SoybeanFarmer
                deriving Show

data Farmer = Farmer Name Acres FarmerType
  deriving Show
