import           Control.Applicative

newtype Compose f g a = Compose
    { getCompose :: f (g a)
    } deriving (Eq, Show)

instance (Functor f, Functor g) => Functor (Compose f g) where
  fmap f (Compose x) = Compose $ (fmap . fmap) f x

instance (Applicative f, Applicative g) => Applicative (Compose f g) where
  pure x = Compose $ (pure . pure) x
  Compose f <*> Compose x = Compose (liftA2 (<*>) f x)

-----------------------------------------------------------------------------
-- 1.
instance (Foldable f, Foldable g) => Foldable (Compose f g) where
  foldMap f (Compose x) = (foldMap . foldMap) f x

-----------------------------------------------------------------------------
-- 2.
instance (Traversable f, Traversable g) => Traversable (Compose f g) where
  traverse f (Compose x) = Compose <$> (traverse . traverse) f x
