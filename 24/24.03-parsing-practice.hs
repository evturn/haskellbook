import           Control.Monad.Trans.State
import           Text.Parser.Combinators
import           Text.Trifecta

one :: Parser Char
one = char '1'

oneTwo :: Parser Char
oneTwo = char '1' >> char '2'

two :: Parser Char
two = char '2'

testParse :: Parser Char -> IO ()
testParse p = print $ parseString p mempty "123"

pNL :: String -> IO ()
pNL s = putStrLn ('\n' : s)

-----------------------------------------------------------------------------
-- 1.
testEOF :: Parser () -> IO ()
testEOF p = print $ parseString p mempty "123"

three :: Parser Char
three = char '3'

-----------------------------------------------------------------------------
-- 2.
testString :: Parser String -> IO ()
testString p = print $ parseString p mempty "123"

strParser :: String -> Parser String
strParser s = string s

main :: IO ()
main = do
  pNL "one:"
  testEOF $ one >> eof
  pNL "oneTwo:"
  testEOF $ oneTwo >> eof
  pNL "1 >> 2 >> 3 >> eof:"
  testEOF $ one >> two >> three >> eof
  pNL "String parsers:"
  testString $ strParser "1"
  testString $ strParser "12"
  testString $ strParser "123"
