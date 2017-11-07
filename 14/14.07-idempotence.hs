import           Data.Char       (toUpper)
import           Data.List       (sort)
import           Test.QuickCheck

twice f = f . f

fourTimes = twice . twice

-----------------------------------------------------------------------------
-- 1.
prop_idempotence :: String -> Bool
prop_idempotence xs = capsTwice xs && capsFourTimes xs
  where
    capsTwice     x = (capitalizeWord x == twice capitalizeWord x)
    capsFourTimes x = (capitalizeWord x == fourTimes capitalizeWord x)

capitalizeWord :: String -> String
capitalizeWord = fmap toUpper

-----------------------------------------------------------------------------
-- 2.
prop_idempotence' :: String -> Bool
prop_idempotence' xs = sortTwice xs && sortFourTimes xs
  where
    sortTwice     x = (sort x == twice sort x)
    sortFourTimes x = (sort x == fourTimes sort x)

main :: IO ()
main = do
  putStrLn "1. Idempotence check"
  quickCheck prop_idempotence
  putStrLn "2. Idempotence check"
  quickCheck prop_idempotence'

