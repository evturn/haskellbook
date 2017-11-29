module RandomExample2 where

import           System.Random

data Die = DieOne
         | DieTwo
         | DieThree
         | DieFour
         | DieFive
         | DieSix
         deriving (Eq, Show)

intToDie :: Int -> Die
intToDie n = case n of
               1 -> DieOne
               2 -> DieTwo
               3 -> DieThree
               4 -> DieFour
               5 -> DieFive
               6 -> DieSix
               x -> error $ "intToDie got non 1-6 integer: " ++ show x

-----------------------------------------------------------------------------
-- 1.
rollsToGetN :: Int -> StdGen -> Int
rollsToGetN n g = go 0 0 g
  where
    go :: Int -> Int -> StdGen -> Int
    go sum count gen
      | sum >= n  = count
      | otherwise = let (die, nextGen) = randomR (1, 6) gen
                     in go (sum + die) (count + 1) nextGen

-----------------------------------------------------------------------------
-- 2.
rollsCountLogged :: Int -> StdGen -> (Int, [Die])
rollsCountLogged n g = go 0 0 g []
  where
    go :: Int -> Int -> StdGen -> [Die] -> (Int, [Die])
    go sum count gen xs
      | sum >= n = (count, xs)
      | otherwise = let (die, nextGen) = randomR (1, 6) gen
                     in go (sum + die) (count + 1) nextGen (intToDie die : xs)
