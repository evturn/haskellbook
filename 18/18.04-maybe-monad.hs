data Cow = Cow
    { name   :: String
    , age    :: Int
    , weight :: Int
    } deriving (Eq, Show)

noEmpty :: String -> Maybe String
noEmpty ""  = Nothing
noEmpty str = Just str

noNegative :: Int -> Maybe Int
noNegative n | n >= 0    = Just n
             | otherwise = Nothing

weightCheck :: Cow -> Maybe Cow
weightCheck c = let w = weight c
                    n = name c
                in if n == "Bess" && w > 499
                   then Nothing
                   else Just c

mkSphericalCow :: String -> Int -> Int -> Maybe Cow
mkSphericalCow name' age' weight' =
  case noEmpty name' of
    Nothing    -> Nothing
    Just nammy ->
      case noNegative age' of
        Nothing   -> Nothing
        Just agey ->
          case noNegative weight' of
            Nothing      -> Nothing
            Just weighty -> weightCheck (Cow nammy agey weighty)

mkSphericalCow' :: String -> Int -> Int -> Maybe Cow
mkSphericalCow' name' age' weight' = do
  nammy <- noEmpty name'
  agey <- noNegative age'
  weighty <- noNegative weight'
  weightCheck (Cow nammy agey weighty)

{- | https://github.com/ghc/ghc/blob/master/libraries/base/GHC/Base.hs

  instance Monad Maybe where
    return x            = Just x

    (Just x) >>= k      = k x
    Nothing  >>= _      = Nothing

    (>>) = (*>)

-}

mkSphericalCow'' :: String -> Int -> Int -> Maybe Cow
mkSphericalCow'' name' age' weight' =
  noEmpty name' >>= \nammy ->
  noNegative age' >>= \agey ->
  noNegative weight' >>= \weighty ->
  weightCheck (Cow nammy agey weighty)

f :: Integer -> Maybe Integer
f 0 = Nothing
f n = Just n

g :: Integer -> Maybe Integer
g i = if even i
      then Just (i + 1)
      else Nothing

h :: Integer -> Maybe String
h i = Just ("10191" ++ show i)

doSomething' :: Integer -> Maybe (Integer, Integer, String)
doSomething' n = do
  a <- f n
  b <- g a
  c <- h b
  pure (a, b, c)
