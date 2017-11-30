applyTimes :: (Eq a, Num a) => a -> (b -> b) -> b -> b
applyTimes 0 f b = b
applyTimes n f b = f . applyTimes (n -1) f $ b

at :: Int
at = applyTimes 5 (+1) 5

at' :: Int
at' = (+1) $ (+1) $ (+1) $ (+1) $ (+1) $ 5

-- Evaluates as follows:
--
-- (+1) (applyTimes (5 - 1) (+1) 5)
-- (+1) ((+1) (applyTimes (4 - 1) (+1) 5))
-- (+1) ((+1) ((+1) (applyTimes (3 - 1) (+1) 5)))
-- (+1) ((+1) ((+1) ((+1) (applyTimes (2 - 1) (+1) 5))))
-- (+1) ((+1) ((+1) ((+1) ((+1) (applyTimes (1 - 1) (+1) 5)))))
-- (+1) ((+1) ((+1) ((+1) ((+1) (5)))))
