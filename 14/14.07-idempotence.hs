import           Data.Char       (toUpper)
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

main :: IO ()
main = do
  putStrLn "Idempotence check"
  quickCheck prop_idempotence

