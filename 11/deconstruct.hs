newtype Name    = Name String deriving Show
newtype Acres   = Acres Int deriving Show

data FarmerType = DairyFarmer
                | WheatFarmer
                | SoybeanFarmer deriving Show

data Farmer =
  Farmer Name Acres FarmerType deriving Show

isDairyFarmer :: Farmer -> Bool
isDairyFarmer (Farmer _ _ DairyFarmer) = True
isDairyFarmer _ = False


-- Avoid propagating bottoms from records

data Automobile = Null
                | Car { make :: String
                      , model :: String
                      , year :: Integer }
                deriving (Eq, Show)

-- To fix the issue above

data Car = Car { make :: String
               , model :: String
               , year :: Integer }
               deriving (Eq, Show)


data Automobile = Null
                | Automobile Car
                deriving (Eq, Show)

---------------

data FarmerRec =
  FarmerRec { name       :: Name
            , acres      :: Acres
            , farmerType :: FarmerType } deriving Show

isDairyFarmerRec :: FarmerRec -> Bool
isDairyFarmerRec farmer = case farmerType farmer of
  DairyFarmer -> True
  _           -> False
