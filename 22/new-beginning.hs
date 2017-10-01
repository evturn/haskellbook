import Control.Applicative

boop = (*2)
doop = (+10)

-- composed functions
bip :: Integer -> Integer
bip = boop . doop

-- functor of partially applied functions
bloop :: Integer -> Integer
bloop = fmap boop doop

-- applicative of partially applied functions
bbop :: Integer -> Integer
bbop = (+) <$> boop <*> doop

duwop :: Integer -> Integer
duwop = liftA2 (+) boop doop

