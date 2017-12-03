module AltParsing where

import           Control.Applicative
import           Text.Trifecta

type NumberOrString = Either Integer String

a :: String
a = "blah"

b :: String
b = "123"

c :: String
c = "123blah789"

parseNos :: Parser NumberOrString
parseNos = (Left <$> integer) <|> (Right <$> some letter)

main :: IO ()
main = do
  let p f i = parseString f mempty i
  print $ p (some letter) a
  print $ p integer b
  print $ p parseNos a
  print $ p parseNos b
  print $ p (many parseNos) c
  print $ p (some parseNos) c
