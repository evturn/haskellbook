module Booley where

import Data.Bool

booley xs = map (\x -> bool x (-x) (x == 3)) xs