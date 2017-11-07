import           Data.List       (sort)
import           Test.QuickCheck

-----------------------------------------------------------------------------
-- 1.
half :: Fractional a => a -> a
half x = x / 2

halfIdentity :: Fractional a => a -> a
halfIdentity = (*2) . half

prop_halfIdentity :: Double -> Bool
prop_halfIdentity x = halfIdentity x == x

-----------------------------------------------------------------------------
-- 2.
listOrdered :: (Ord a) => [a] -> Bool
listOrdered xs = snd $ foldr go (Nothing, True) xs
  where
    go _ status@(_, False) = status
    go y (Nothing, t)      = (Just y, t)
    go y (Just x, t)       = (Just y, x >= y)

prop_listOrdered :: String -> Bool
prop_listOrdered = listOrdered . sort

-----------------------------------------------------------------------------

main :: IO ()
main = do
  putStrLn "1. halfIdentity"
  quickCheck prop_halfIdentity

  putStrLn "2. listOrdered"
  quickCheck prop_listOrdered

