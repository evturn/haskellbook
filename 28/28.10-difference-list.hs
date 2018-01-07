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
