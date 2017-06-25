module NaturalNumbers where

data Nat = Zero
         | Succ Nat
         deriving (Eq, Show)

natToInteger :: Nat -> Integer
natToInteger Zero = 0
natToInteger (Succ n) = 1 + natToInteger n

integerToNat :: Integer -> Maybe Nat
integerToNat n
  | n < 0     = Nothing
  | n == 0    = Just Zero
  | otherwise = doIt $ integerToNat (n -1)
    where
      doIt (Just x) = Just (Succ x)
      doIt Nothing  = Nothing

main :: IO ()
main = print $ integerToNat 16