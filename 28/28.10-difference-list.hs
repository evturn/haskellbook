import           Criterion.Main

newtype DList a = DL { unDL :: [a] -> [a] }

-----------------------------------------------------------------------------
-- 1.
empty :: DList a
empty = DL $ \_ -> []
{-# INLINE empty #-}

-----------------------------------------------------------------------------
-- 2.
singleton :: a -> DList a
singleton x = DL $ \_ -> [x]
{-# INLINE singleton #-}

-----------------------------------------------------------------------------
-- 3.
toList :: DList a -> [a]
toList d = (unDL d) []
{-# INLINE toList #-}

-----------------------------------------------------------------------------
-- 4.
infixr `cons`
cons :: a -> DList a -> DList a
cons x xs = DL ((x:) . unDL xs)
{-# INLINE cons #-}

-----------------------------------------------------------------------------
-- 5.
infixl `snoc`
snoc :: DList a -> a -> DList a
snoc xs x = DL ((++  [x]) . unDL xs)
{-# INLINE snoc #-}

-----------------------------------------------------------------------------
-- 6.
append :: DList a -> DList a -> DList a
append xs ys = DL (unDL xs . unDL ys)
{-# INLINE append #-}

schlemiel :: Int -> [Int]
schlemiel i = go i []
  where
    go 0 xs = xs
    go n xs = go (n-1) ([n] ++ xs)

constructDlist :: Int -> [Int]
constructDlist i = toList $ go i empty
  where
    go 0 xs = xs
    go n xs = go (n-1) (singleton n `append` xs)

main :: IO ()
main = defaultMain
  [ bench "concat list" $
    whnf schlemiel 123456
  , bench "concat dlist" $
    whnf constructDlist 123456
  ]
