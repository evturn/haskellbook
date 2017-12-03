{-# LANGUAGE QuasiQuotes #-}

module Quasimodo where

import           Control.Applicative
import           Text.RawString.QQ
import           Text.Trifecta

type NumberOrString = Either Integer String

parseNos :: Parser NumberOrString
parseNos = skipMany (oneOf "\n")
           >>  (Left <$> integer)
           <|> (Right <$> some letter)

eitherOr :: String
eitherOr = [r|
123
abc
456
def|]

main :: IO ()
main = do
  let p f i = parseString f mempty i
  print $ p parseNos eitherOr
