module WordNumber
    ( digitToWord
    , digits
    , wordNumber
    ) where

import           Data.List (intersperse)

digitToWord :: Int -> String
digitToWord n = [ "zero"
                , "one"
                , "two"
                , "three"
                , "four"
                , "five"
                , "six"
                , "seven"
                , "eight"
                , "nine"
                ] !! n

digits :: Int -> [Int]
digits n
    | n == 0    = []
    | otherwise = digits (div n 10) ++ [mod n 10]

wordNumber :: Int -> String
wordNumber = joinWords . getWords
  where
    joinWords  = concat . intersperse "-"
    getWords n = map digitToWord $ digits n

