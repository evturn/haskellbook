module Cipher where

import           Data.Char

tooHigh :: Int -> Bool
tooHigh = (>122)

tooLow :: Int -> Bool
tooLow = (<97)

trim :: Int -> Int
trim n = mod n 122

pad :: Int -> Int
pad n = mod 97 n

shiftInt :: Int -> Char -> Int
shiftInt n c = shiftWrap $ (ord c) + n

unshiftInt :: Int -> Char -> Int
unshiftInt n c = unshiftWrap $ (ord c) - n

shiftWrap :: Int -> Int
shiftWrap n = if tooHigh n
              then 96 + trim n
              else n

unshiftWrap :: Int -> Int
unshiftWrap n = if tooLow n
                then 123 - pad n
                else n

caesar :: Int -> String -> String
caesar n xs = map (chr . (shiftInt n)) xs

unCaesar :: Int -> String -> String
unCaesar n xs = map (chr . (unshiftInt n)) xs

