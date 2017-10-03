import Control.Applicative (liftA2)

newtype HumanName =
  HumanName String
  deriving (Eq, Show)

newtype DogName =
  DogName String
  deriving (Eq, Show)

newtype Address = 
  Address String
  deriving (Eq, Show)

data Person =
  Person {
    humanName :: HumanName
  , dogName :: DogName
  , address :: Address
  } deriving (Eq, Show)

data Dog =
  Dog {
    dogsName :: DogName
  , dogsAddress :: Address 
  } deriving (Eq, Show)

pers :: Person
pers =
  Person (HumanName "Doug Douglas")
         (DogName "Cranky")
         (Address "100 W. 100th")

chris :: Person
chris = 
  Person (HumanName "Chris Paul")
         (DogName "Dr. Snagggles")
         (Address "Westside")

getDogR' :: Person -> Dog
getDogR' = liftA2 Dog dogName address
