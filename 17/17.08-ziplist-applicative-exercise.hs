import           Test.QuickCheck
import           Test.QuickCheck.Checkers
import           Test.QuickCheck.Classes

data List a = Nil
            | Cons a (List a)
            deriving (Eq, Show)

take' :: Int -> List a -> List a
take' = undefined

instance Functor List where
  fmap _ Nil         = Nil
  fmap f (Cons x xs) = Cons (f x) (fmap f xs)

instance Applicative List where
  pure x           = Cons x Nil
  _ <*> Nil        = Nil
  Nil <*> _        = Nil
  Cons f fs <*> xs = append (f <$> xs) (fs <*> xs)

instance Arbitrary a => Arbitrary (List a) where
  arbitrary = do
    x <- arbitrary
    return $ Cons x Nil

instance Eq a => EqProp (List a) where
  (=-=) = eq

append :: List a -> List a -> List a
append Nil ys         = ys
append (Cons x xs) ys = Cons x $ xs `append` ys

newtype ZipList' a = ZipList' (List a)
  deriving (Eq, Show)

instance Eq a => EqProp (ZipList' a) where
  xs =-= ys = xs' `eq` ys'
    where
      xs' = let (ZipList' l) = xs
            in take' 3000 l
      ys' = let (ZipList' l) = ys
            in take' 3000 l

instance Functor ZipList' where
  fmap f (ZipList' xs) = ZipList' $ fmap f xs

instance Applicative ZipList' where
  pure x                        = ZipList' $ repeat' x
  _            <*> ZipList' Nil = ZipList' Nil
  ZipList' Nil <*> _            = ZipList' Nil
  ZipList' fs  <*> ZipList' xs  = ZipList' $ zipWith' id fs xs

instance Arbitrary a => Arbitrary (ZipList' a) where
  arbitrary = do
    x <- arbitrary
    return $ ZipList' $ Cons x Nil

repeat' :: a -> (List a)
repeat' x = xs
  where
    xs = Cons x xs

zipWith' :: (a -> b -> c) -> List a -> List b -> List c
zipWith' _ Nil _                   = Nil
zipWith' _ _ Nil                   = Nil
zipWith' f (Cons x xs) (Cons y ys) = Cons (f x y) (zipWith' f xs ys)

main :: IO ()
main = do
  putStrLn "Here we go."
  quickBatch $ applicative $ ZipList' $ Cons ('a', 'b', 'c') Nil
