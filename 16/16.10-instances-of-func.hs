{-# LANGUAGE ViewPatterns #-}

import           Test.QuickCheck
import           Test.QuickCheck.Function

functorIdentity :: (Functor f, Eq (f a)) => f a -> Bool
functorIdentity f = fmap id f == f

functorCompose :: (Functor f, Eq (f c))
               => (a -> b)
               -> (b -> c)
               -> f a
               -> Bool
functorCompose f g x = (fmap g (fmap f x)) == (fmap (g . f) x)

functorCompose' :: (Functor f, Eq (f c))
                => f a
                -> Fun a b
                -> Fun b c
                -> Bool
functorCompose' x (Fun _ f) (Fun _ g) =
  (fmap (g . f) x) == (fmap g . fmap f $ x)

type IntToInt = Fun Int Int
type IntFC = [Int] -> IntToInt -> IntToInt -> Bool

-----------------------------------------------------------------------------
-- 1.
newtype Identity a = Identity a
  deriving (Eq, Show)

instance Functor Identity where
  fmap f (Identity x) = Identity (f x)

instance Arbitrary a => Arbitrary (Identity a) where
  arbitrary = do
    x <- arbitrary
    return $ Identity x

type IdId = Identity Int -> Bool
type IdFC = Identity Int -> IntToInt -> IntToInt -> Bool

-----------------------------------------------------------------------------
-- 2.
data Pair a = Pair a a
  deriving (Eq, Show)

instance Functor Pair where
  fmap f (Pair x y) = Pair (f x) (f y)

instance Arbitrary a => Arbitrary (Pair a) where
  arbitrary = do
    x <- arbitrary
    return $ Pair x x

type PairId = Pair Int -> Bool
type PairFC = Pair Int -> IntToInt -> IntToInt -> Bool

main :: IO ()
main = do
  putStrLn "\n 1. Identity"
  quickCheck (functorIdentity :: IdId)
  quickCheck (functorCompose' :: IdFC)
  putStrLn "\n 1. Pair"
  quickCheck (functorIdentity :: PairId)
  quickCheck (functorCompose' :: PairFC)
