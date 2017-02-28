import Data.Char


yellingHello []     = []
yellingHello xs = filter (\x -> isUpper x) xs

capitalizeFirstLetter []     = []
capitalizeFirstLetter (x:xs) = toUpper x : xs

allCaps []     = []
allCaps (x:xs) = toUpper x : allCaps xs

capsOnFirst = toUpper . head