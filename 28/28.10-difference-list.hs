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
snoc xs x = DL ((++ [x]) . unDL xs)
{-# INLINE snoc #-}
