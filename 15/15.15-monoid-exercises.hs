import           Data.Semigroup  (Semigroup, (<>))
import           Test.QuickCheck hiding (Failure, Success)

semigroupAssoc :: (Eq m, Semigroup m) => m -> m -> m -> Bool
semigroupAssoc a b c = (a <> (b <> c)) == ((a <> b) <> c)

monoidAssoc       :: (Eq m, Semigroup m, Monoid m) => m -> m -> m -> Bool
monoidAssoc a b c = (a <> (b <> c)) == ((a <> b) <> c)

monoidLeftIdentity   :: (Eq m, Semigroup m, Monoid m) => m -> Bool
monoidLeftIdentity a = (mempty <> a) == a

monoidRightIdentity   :: (Eq m, Semigroup m, Monoid m) => m -> Bool
monoidRightIdentity a = (a <> mempty) == a

-----------------------------------------------------------------------------
-- 1.
data Trivial = Trivial
  deriving (Eq, Show)

instance Semigroup Trivial where
  _ <> _ = Trivial

instance Monoid Trivial where
  mempty  = Trivial
  mappend = (<>)

instance Arbitrary Trivial where
  arbitrary = return Trivial

type TrivAssoc = Trivial -> Trivial -> Trivial -> Bool
type TrivId    = Trivial -> Bool

-----------------------------------------------------------------------------
-- 2.
newtype Identity a = Identity a
  deriving (Eq, Show)

instance Semigroup a => Semigroup (Identity a) where
  Identity x <> Identity y = Identity (x <> y)

instance (Semigroup a, Monoid a) => Monoid (Identity a) where
  mempty = Identity mempty
  mappend = (<>)

instance Arbitrary a => Arbitrary (Identity a) where
  arbitrary = do
    x <- arbitrary
    return $ Identity x

type IdAssoc = Identity String -> Identity String -> Identity String -> Bool
type IdId    = Identity String -> Bool

-----------------------------------------------------------------------------

main :: IO ()
main = do
  putStrLn "1. Trivial"
  quickCheck (semigroupAssoc      :: TrivAssoc)
  quickCheck (monoidLeftIdentity  :: TrivId)
  quickCheck (monoidRightIdentity :: TrivId)
  putStrLn "2. Identity"
  quickCheck (semigroupAssoc :: IdAssoc)
  quickCheck (monoidLeftIdentity :: IdId)
  quickCheck (monoidRightIdentity :: IdId)
