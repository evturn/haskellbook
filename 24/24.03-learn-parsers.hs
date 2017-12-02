module LearnParsers where

import           Control.Monad.Trans.State
import           Text.Trifecta

stop :: Parser a
stop = unexpected "stop"

one :: Parser Char
one = char '1'

one' :: Parser b
one' = one >> stop

type Token = Char

type    Parser'   a =     String -> Maybe  (a,  String)
newtype Parser''  a = P ([Token] ->       [(a, [Token])])
type    Parser''' a =     String ->       [(a,  String)]

oneTwo :: Parser Char
oneTwo = char '1' >> char '2'

oneTwo' :: Parser b
oneTwo' = oneTwo >> stop

testParse :: Parser Char -> IO ()
testParse p = print $ parseString p mempty "123"

pNL :: String -> IO ()
pNL s = putStrLn ('\n' : s)

main :: IO ()
main = do
  pNL "stop:"
  testParse stop
  pNL "one:"
  testParse one
  pNL "one':"
  testParse one'
  pNL "oneTwo:"
  testParse oneTwo
  pNL "oneTwo':"
  testParse oneTwo'
