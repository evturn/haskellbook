module ReaderPractice where

import           Control.Applicative
import           Data.Maybe

x :: [Integer]
x = [1, 2, 3]

y :: [Integer]
y = [4, 5, 6]

z :: [Integer]
z = [7, 8, 9]

xs :: Maybe Integer
xs = lookup 3 $ zip x y

ys :: Maybe Integer
ys = lookup 6 $ zip y z

zs :: Maybe Integer
zs = lookup 4 $ zip x y

z' :: Integer -> Maybe Integer
z' n = lookup n $ zip x z

x1 :: Maybe (Integer, Integer)
x1 = (,) <$> xs <*> ys

x2 :: Maybe (Integer, Integer)
x2 = (,) <$> ys <*> zs

x3 :: Integer -> (Maybe Integer, Maybe Integer)
x3 = (,) <$> z' <*> z'

summed :: Num c => (c, c) -> c
summed = uncurry (+)

bolt :: Integer -> Bool
bolt = (&&) <$> (>3) <*> (<8)

sequA :: Integral a => a -> [Bool]
sequA m = sequenceA [(>3), (<8), even] m

s' :: Maybe Integer
s' = summed <$> ((,) <$> xs <*> ys)

-----------------------------------------------------------------------------
-- 1.
sequenceAll :: Integer -> Bool
sequenceAll n = foldr (&&) True $ sequA n

-----------------------------------------------------------------------------
-- 2.
sequenceSum :: [Bool]
sequenceSum = sequA $ fromMaybe 0 s'

-----------------------------------------------------------------------------
-- 3.
liftAll :: Bool
liftAll = bolt $ fromMaybe 0 ys


main :: IO ()
main = do
  print $ sequenceAll 6
  print sequenceSum
  print liftAll
