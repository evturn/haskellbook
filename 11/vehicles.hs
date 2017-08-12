module Vehicles where

data Price =
  Price Integer
  deriving (Eq, Show)

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

data Size =
    Massive
  | Regular
  | Microscopic
  deriving (Eq, Show)

data Vehicle =
    Car Manufacturer Price
  | Plane Airline Size
  deriving (Eq, Show)

myCar :: Vehicle
myCar = Car Mini (Price 14000)
urCar = Car Mazda (Price 200000)
clownCar = Car Tata (Price 7000)
doge = Plane PapuAir Massive
catt = Plane PapuAir Microscopic

isCar :: Vehicle -> Bool
isCar (Car _ _) = True
isCar (Plane _ _) = False

isPlane :: Vehicle -> Bool
isPlane (Plane _ _) = True
isPlane (Car _ _) = False

areCars :: [Vehicle] -> [Bool]
areCars xs = map isCar xs

getManu :: Vehicle -> Manufacturer
getManu (Car a _) = a

getSize :: Vehicle -> Size
getSize (Plane _ b) = b
