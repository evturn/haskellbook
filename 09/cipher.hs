module Cipher where

import Data.Char
import Data.Bool

toOrd x = ord x
toChr x = chr x
chopDown x = (x - 122) + 96
propUp x = (x + 122) - 96
containOrd x = bool x (chopDown x) (x > 122)
reduceOrd x = bool x (propUp x) (x < 97)

caesar []     = []
caesar (x:xs) = map containOrd $ 5 + toOrd x : caesar xs

uncaesar []     = []
uncaesar (x:xs) = map reduceOrd $ x - 5 : uncaesar xs

doIt xs = map toChr $ uncaesar $ caesar xs