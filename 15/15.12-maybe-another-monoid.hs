import           Data.Monoid
import           Test.QuickCheck

data Optional a = Nada
                | Only a
                deriving (Eq, Show)

instance Monoid a => Monoid (Optional a) where
  mempty                    = Nada
  mappend (Only a) (Only b) = Only (mappend a b)
  mappend Nada     (Only b) = Only b
  mappend (Only a) Nada     = Only a
  mappend Nada     Nada     = Nada

monoidAssoc       :: (Eq m, Monoid m) => m -> m -> m -> Bool
monoidAssoc a b c = (a <> (b <> c)) == ((a <> b) <> c)

monoidLeftIdentity   :: (Eq m, Monoid m) => m -> Bool
monoidLeftIdentity a = (mempty <> a) == a

monoidRightIdentity   :: (Eq m, Monoid m) => m -> Bool
monoidRightIdentity a = (a <> mempty) == a

newtype First' a = First'
                 { getFirst' :: Optional a }
                 deriving (Eq, Show)

instance Monoid a => Monoid (First' a) where
  mempty                        = First' Nada
  mappend (First' a) (First' b) = First' (mappend a b)

instance Arbitrary a => Arbitrary (First' a) where
  arbitrary = do
    a <- arbitrary
    frequency [ (1, return $ First' $ Only a)
              , (1, return $ First' Nada)
              ]

firstMappend :: Monoid a => First' a -> First' a -> First' a
firstMappend = mappend

type FirstMappend = First' String -> First' String -> First' String -> Bool
type FstId        = First' String -> Bool

main :: IO ()
main = do
  quickCheck (monoidAssoc         :: FirstMappend)
  quickCheck (monoidLeftIdentity  :: FstId)
  quickCheck (monoidRightIdentity :: FstId)
