import Data.Time

data DatabaseItem = DbString String
                  | DbNumber Integer
                  | DbDate   UTCTime
                  deriving (Eq, Ord, Show)

theDatabase :: [DatabaseItem]
theDatabase =
  [ DbDate (UTCTime (fromGregorian 1911 5 1) (secondsToDiffTime 34123))
  , DbNumber 9001
  , DbString "Fuck off!"
  , DbDate (UTCTime (fromGregorian 1921 5 1) (secondsToDiffTime 34123))
  , DbNumber 999
  , DbNumber 123
  , DbNumber 343
  ]

filterDbDate :: [DatabaseItem] -> [UTCTime]
filterDbDate xs = foldr getDates [] xs
  where
    getDates (DbDate x) acc = x : acc
    getDates _ acc          = acc

filterDbNumber :: [DatabaseItem] -> [Integer]
filterDbNumber xs = foldr getNumbers [] xs
  where
    getNumbers (DbNumber x) acc = x : acc
    getNumbers _ acc            = acc

mostRecent :: [DatabaseItem] -> UTCTime
mostRecent xs = maximum $ filterDbDate xs

sumDb :: [DatabaseItem] -> Integer
sumDb xs = foldr (+) 0 $ filterDbNumber xs

avgDb :: [DatabaseItem] -> Double
avgDb xs =  (fromIntegral (sumDb xs)) / (fromIntegral (length $ filterDbNumber xs))