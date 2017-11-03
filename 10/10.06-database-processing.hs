import Data.Time

data DatabaseItem = DbString String
                  | DbNumber Integer
                  | DbDate   UTCTime
                  deriving (Eq, Ord, Show)

theDatabase :: [DatabaseItem]
theDatabase = 
    [ DbDate (UTCTime (fromGregorian 1911 5 1) (secondsToDiffTime 34123))
    , DbNumber 9001
    , DbString "Hello, world!"
    , DbDate (UTCTime (fromGregorian 1921 5 1) (secondsToDiffTime 34123))
    ]

-- 1.
-- Write a function that filters for `DbDate` values and returns a list of
-- `UTCTime` values inside them.
filterDbDate :: [DatabaseItem] -> [UTCTime]
filterDbDate = go
  where
    go []              = []
    go ((DbDate y):ys) = y : go ys
    go (_:ys)          = go ys
