import           Test.QuickCheck

square x = x * x

prop_squareIdentity :: Positive Double -> Bool
prop_squareIdentity (Positive x) = (square . sqrt) x == x

main :: IO ()
main = do
  putStrLn "Property should not hold"
  quickCheck prop_squareIdentity


