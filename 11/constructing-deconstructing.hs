-- Constructing values

data GuessWhat = FaceBonez deriving (Eq, Show)

data Id a = Me a deriving (Eq, Show)

data Product a b = Product a b deriving (Eq, Show)

data Sum a b = First a
             | Second b
             deriving (Eq, Show)

data RecordProduct a b =
  RecordProduct { pfirst  :: a
                , psecond :: b }
                deriving (Eq, Show)

newtype NumCow = NumCow Int deriving (Eq, Show)
newtype NumPig = NumPig Int deriving (Eq, Show)

data Farmhouse = Farmhouse NumCow NumPig deriving (Eq, Show)

type Farmhouse' = Product NumCow NumPig

newtype NumSheep = NumSheep Int deriving (Eq, Show)

data BigFarmhouse = BigFarmhouse NumCow NumPig NumSheep deriving (Eq, Show)

type BigFarmhouse' = Product NumCow (Product NumPig NumSheep)
type Name = String
type Age = Int
type LovesMud = Bool
type PoundsOfWool = Int

data CowInfo = CowInfo Name Age deriving (Eq, Show)
data PigInfo = PigInfo Name Age LovesMud deriving (Eq, Show)
data SheepInfo = SheepInfo Name Age PoundsOfWool deriving (Eq, Show)

data Animal = Cow CowInfo
            | Pig PigInfo
            | Sheep SheepInfo
            deriving (Eq, Show)

type Animal' = Sum CowInfo (Sum PigInfo SheepInfo)

trivialValue :: GuessWhat
trivialValue = FaceBonez

idInt :: Id Integer
idInt = Me 10

idIdentity :: Id (a -> a)
idIdentity = Me $ \x -> x

type Dudical = Bool

person :: Product Name Dudical
person = Product "Rufus" True



-- Deconstructing values

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


