data Price = Price Integer deriving (Eq, Show)

data Manufacturer =
    Mini
  | Mazda
  | Tata
  deriving (Eq, Show)

data Airline =
    PapuAir
  | CatapultsR'Us
  | TakeYourChancesUnited
  deriving (Eq, Show)

data Vehicle =
    Car Manufacturer Price
  | Plane Airline
  deriving (Eq, Show)

myCar    = Car Mini (Price 14000)
urCar    = Car Mazda (Price 20000)
clownCar = Car Tata (Price 7000)
doge     = Plane PapuAir

-- 1.
-- What is the type of myCar?
-- myCar :: Vehicle

-- 2.
-- Define the functions.
isCar :: Vehicle -> Bool
isCar (Plane _) = False
isCar (Car _ _) = True

isPlane :: Vehicle -> Bool
isPlane (Car _ _) = False
isPlane (Plane _) = True

areCars :: [Vehicle] -> [Bool]
areCars = fmap isCar
