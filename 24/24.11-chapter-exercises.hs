import           Control.Applicative
import           Text.Trifecta

-----------------------------------------------------------------------------
-- 1.
data NumberOrString = NOSS String
                    | NOSI Integer
                    deriving (Eq, Show)

type Major    = Integer
type Minor    = Integer
type Patch    = Integer
type Release  = [NumberOrString]
type Metadata = [NumberOrString]

data SemVer = SemVer Major Minor Patch Release Metadata
  deriving (Eq, Show)

parseNOS :: Parser NumberOrString
parseNOS = (NOSI <$> integer) <|> (NOSS <$> some letter)

parseMeta :: Parser [NumberOrString]
parseMeta = do
  skipDelimiter
  x <- parseNOS
  skipDelimiter
  y <- parseNOS
  return [x, y]

skipDelimiter :: Parser ()
skipDelimiter = skipMany (char '.' <|> char '-')

parseSemVer :: Parser SemVer
parseSemVer = do
  major <- integer
  skipDelimiter
  minor <- integer
  skipDelimiter
  patch <- integer
  release <- parseMeta
  return $ SemVer major minor patch release []

main :: IO ()
main = do
  print $ parseString parseSemVer mempty "2.1.1-x.7"
