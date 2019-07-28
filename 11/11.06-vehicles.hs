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
  | Plane Airline Size
  deriving (Eq, Show)

-- Added for question 5.
data Size =
    S
  | M
  | L
  | XL
  deriving (Eq, Show)

myCar    = Car Mini (Price 14000)
urCar    = Car Mazda (Price 20000)
clownCar = Car Tata (Price 7000)
doge     = Plane PapuAir XL

-- 1.
-- What is the type of myCar?
-- myCar :: Vehicle

-- 2.
-- Define the functions.
isCar :: Vehicle -> Bool
isCar (Car _ _) = True
isCar _         = False

-- Alternative implemantations:
isCar2 :: Vehicle -> Bool
isCar2 vehicle = case vehicle of
  (Car _ _) -> True
  _ -> False

isCar3 :: Vehicle -> Bool
isCar3 vehicle
  | (Car _ _) <- vehicle = True
  | otherwise = False
 

isPlane :: Vehicle -> Bool
isPlane (Plane _ _) = True
isPlane _           = False

areCars :: [Vehicle] -> [Bool]
areCars = fmap isCar

-- 3.
-- Write a function that returns the manufacturer of a piece of data.
getManu :: Vehicle -> Manufacturer
getManu (Car x _) = x
getManu _         = error "\n\nNo manufacturer found.\n"

-- 4.
-- What will happen if you use `getManu` on `Plane` data?
-- Non-exhaustive patterns exception

-- 5.
-- Add the size of a plane as an argument to the `Plane` constructor.
