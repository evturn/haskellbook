import           Test.QuickCheck
import           Test.QuickCheck.Checkers
import           Test.QuickCheck.Classes

data List a = Nil
            | Cons a (List a)
            deriving (Eq, Show)

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

listAp :: List (String, String, Int)
listAp = undefined

-----------------------------------------------------------------------------

main :: IO ()
main = do
  putStrLn "\n-- List"
  quickBatch $ functor     listAp
  quickBatch $ applicative listAp

append :: List a -> List a -> List a
append Nil ys         = ys
append (Cons x xs) ys = Cons x $ xs `append` ys

fold :: (a -> b -> b) -> b -> List a -> b
fold _ b Nil        = b
fold f b (Cons h t) = f h (fold f b t)

concat' :: List (List a) -> List a
concat' = fold append Nil

flatMap :: (a -> List b) -> List a -> List b
flatMap f as = undefined
