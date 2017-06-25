
zip' _ []          = []
zip' [] _          = []
zip' (x:xs) (y:ys) = (x, y) : zip' xs ys

zipWith' _ _ []          = []
zipWith' _ [] _          = []
zipWith' f (x:xs) (y:ys) = f x y : zipWith' f xs ys