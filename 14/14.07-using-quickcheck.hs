import           Test.QuickCheck

-- 1.
half :: Fractional a => a -> a
half x = x / 2

halfIdentity :: Fractional a => a -> a
halfIdentity = (*2) . half

prop_halfIdentity :: Double -> Bool
prop_halfIdentity x = halfIdentity x == x

main :: IO ()
main = do
  putStrLn "1. halfIdentity"
  quickCheck prop_halfIdentity

