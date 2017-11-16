instance Functor ((,) a) where
  fmap f (x, y) = (x, f y)

instance Monoid a => Applicative ((,) a) where
  pure x            = (mempty, x)
  (u, f) <*> (v, x) = (u `mappend` v, f x)

instance Foldable ((,) a) where
  foldMap f (_, y) = f y
  foldr f z (_, y) = f y z

instance Traversable ((,) a) where
  traverse f (x, y) = (,) x <$> f y
