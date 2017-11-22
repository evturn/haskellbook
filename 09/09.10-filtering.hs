-- 1.
multiplesOfThree :: [Int] -> [Int]
multiplesOfThree = filter (\x -> x `mod` 3 == 0)

-----------------------------------------------------------------------------
-- 2.
multiplesOfThreeLength :: [Int] -> Int
multiplesOfThreeLength = length . multiplesOfThree

-----------------------------------------------------------------------------
-- 3.
myFilter :: String -> [String]
myFilter = filter (\xs -> not $ elem xs ["the", "a", "an"]) . words
