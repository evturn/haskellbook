module Main where

import           Criterion.Main
import qualified Data.Vector         as V
import qualified Data.Vector.Unboxed as U

v :: V.Vector Int
v = V.fromList [1..1000]

u :: U.Vector Int
u = U.fromList [1..1000]

main :: IO ()
main = defaultMain
  [ bench "slicing boxed" $
    whnf (V.head . V.slice 100 900) v
  , bench "slicing unboxed" $
    whnf (U.head . U.slice 100 900) u
  ]
