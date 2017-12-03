{-# LANGUAGE OverloadedStrings #-}

module TryTry where

import           Control.Applicative
import           Data.Ratio          ((%))
import           Text.Trifecta

type DecimalOrFraction = Either Rational Integer

parseFraction :: Parser Rational
parseFraction = do
  numerator <- decimal
  char '/'
  denominator <- decimal
  return (numerator % denominator)

parseNum :: Parser DecimalOrFraction
parseNum = try (Left  <$> parseFraction)
           <|> (Right <$> decimal)

main :: IO ()
main = do
  let p f i = parseString f mempty i
  print $ p parseNum "1/2"
  print $ p parseNum "4321"
  print $ p parseNum "3/4"
  print $ p parseNum "3"
