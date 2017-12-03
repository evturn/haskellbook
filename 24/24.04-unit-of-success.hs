import           Text.Trifecta

parseInteger :: Parser Integer
parseInteger = do
  x <- integer
  e <- eof
  return x

parseSuccess :: Result Integer
parseSuccess = parseString parseInteger mempty "123"

parseFailure :: Result Integer
parseFailure = parseString parseInteger mempty "123abc"

main :: IO ()
main = do
  print parseSuccess
  print parseFailure
