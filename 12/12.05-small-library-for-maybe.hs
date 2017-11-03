-- 1.
-- Write a function for simple boolean checks for Maybe values.
isJust :: Maybe a -> Bool
isJust Nothing = False
isJust _       = True

isNothing :: Maybe a -> Bool
isNothing Nothing = True
isNothing _       = False

-- 2.
-- Write the definition for the following `Maybe` catamorphism.
mayybee :: b -> (a -> b) -> Maybe a -> b
mayybee b f Nothing  = b
mayybee b f (Just a) = f a

-- 3.
-- Write the definition for providing a fallback value.
fromMaybe :: a -> Maybe a -> a
fromMaybe a Nothing  = a
fromMaybe _ (Just a) = a

-- 4.
-- Write the definitions for covertng `List` and `Maybe`.
listToMaybe :: [a] -> Maybe a
listToMaybe [] = Nothing
listToMaybe (x:xs) = Just x

maybeToList :: Maybe a -> [a]
maybeToList Nothing   = []
maybeToList (Just xs) = [xs]

-- 5.
-- Write the definition for dropping the `Nothing` values from a list.
catMaybes :: [Maybe a] -> [a]
catMaybes []            = []
catMaybes (Nothing:xs)  = catMaybes xs
catMaybes ((Just x):xs) = x : catMaybes xs

-- 6.
-- Write an function that flips `[Maybe a]` to a `Maybe [a]` where a `Nothing`
-- found in the list returns the sole value of `Nothing`.
flipMaybe :: [Maybe a] -> Maybe [a]
flipMaybe = foldl doIt (Just [])
  where
    doIt Nothing _          = Nothing
    doIt _ Nothing          = Nothing
    doIt (Just xs) (Just x) = Just (xs ++ [x])
