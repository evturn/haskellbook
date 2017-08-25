import Data.Traversable
import Test.QuickCheck
import Test.QuickCheck.Classes
import Test.QuickCheck.Checkers

type TI = []


main = do
  let trigger :: TI (Int, Int, [Int])
      trigger = undefined
  quickBatch (traversable trigger)
