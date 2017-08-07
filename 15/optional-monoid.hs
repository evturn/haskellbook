import Control.Monad
import Data.Monoid
import Test.QuickCheck

data Optional a = Nada
                | Only a
                deriving (Eq, Show)

genOnly :: Arbitrary a => Gen (Optional a)
genOnly = do
  x <- arbitrary
  return $ Only x

instance Arbitrary a => Arbitrary (Optional a) where
  arbitrary = frequency [ (1, genOnly)
            , (1, return Nada) ]

instance Monoid a => Monoid (Optional a) where
  mempty                    = Nada
  mappend Nada     Nada     = Nada
  mappend Nada     (Only a) = Only a
  mappend (Only a) Nada     = Only a
  mappend (Only a) (Only b) = Only (a <> b)


monoidAssoc :: (Eq m, Monoid m) => m -> m -> m -> Bool
monoidAssoc a b c = (a <> (b <> c )) == ((a <> b) <> c)

monoidLeftIdentity :: (Eq m, Monoid m) => m -> Bool
monoidLeftIdentity a = (mempty <> a) == a

monoidRightIdentity :: (Eq m, Monoid m) => m -> Bool
monoidRightIdentity a = (a <> mempty) == a

newtype First' a =
  First' { getFirst' :: Optional a }
  deriving (Eq, Show)

instance Monoid (First' a) where
  mempty = (First' { getFirst' = Nada })
  mappend (First' { getFirst' = Nada }) (First' { getFirst' = Nada }) = (First' { getFirst' = Nada })
  mappend (First' { getFirst' = Nada }) (First' { getFirst' = Only a }) = (First' { getFirst' = Only a })
  mappend (First' { getFirst' = Only a }) (First' { getFirst' = Nada }) = (First' { getFirst' = Only a })
  mappend (First' { getFirst' = Only a }) (First' { getFirst' = Only _ }) = (First' { getFirst' = Only a })

firstMappend :: First' a
             -> First' a
             -> First' a
firstMappend = mappend

type FirstMappend = First' String
                 -> First' String
                 -> First' String
                 -> Bool

type FstId = First' String -> Bool

genFirst :: Arbitrary a => Gen (First' a)
genFirst = do
  x <- arbitrary
  return First' { getFirst' = x }

instance Arbitrary a => Arbitrary (First' a) where
  arbitrary = genFirst

main :: IO ()
main = do
  quickCheck (monoidAssoc :: FirstMappend)
  quickCheck (monoidLeftIdentity :: FstId)
  quickCheck (monoidRightIdentity :: FstId)