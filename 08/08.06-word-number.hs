module WordNumber where

import           Data.List (intersperse)

digitToWord :: Int -> String
digitToWord n = case n of
                  0 -> "zero"
                  1 -> "one"
                  2 -> "two"
                  3 -> "three"
                  4 -> "four"
                  5 -> "five"
                  6 -> "six"
                  7 -> "seven"
                  8 -> "eight"
                  9 -> "nine"

digits :: Int -> [Int]
digits n = go n []
  where
    go 0 xs = xs
    go x xs = go (div x 10) ([mod x 10] ++ xs)

wordNumber :: Int -> String
wordNumber n = concat . (intersperse "-") . (map digitToWord) $ digits n
