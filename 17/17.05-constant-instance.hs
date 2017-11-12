-- Write an `Applicative` instance for `Constant`
--
newtype Constant a b = Constant
                     { getConstant :: a }
                     deriving (Eq, Ord, Show)

instance Functor (Constant a) where
  fmap _ (Constant x) = Constant x

instance Monoid a => Applicative (Constant a) where
  pure _                    = Constant mempty
  Constant x <*> Constant y = Constant (x `mappend` y)
