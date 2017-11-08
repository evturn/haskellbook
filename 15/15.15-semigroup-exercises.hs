import           Data.Semigroup
import           Test.QuickCheck

-----------------------------------------------------------------------------
-- 1.
data Trivial = Trivial
  deriving (Eq, Show)

instance Semigroup Trivial where
  _ <> _ = Trivial

instance Arbitrary Trivial where
  arbitrary = return Trivial

semigroupAssoc :: (Eq m, Semigroup m) => m -> m -> m -> Bool
semigroupAssoc a b c = (a <> (b <> c)) == ((a <> b) <> c)

type TrivAssoc = Trivial -> Trivial -> Trivial -> Bool

-----------------------------------------------------------------------------
-- 2.
newtype Identity a = Identity a
  deriving (Eq, Show)

instance Semigroup a => Semigroup (Identity a) where
  Identity x <> Identity y = Identity (x <> y)

instance Arbitrary a => Arbitrary (Identity a) where
  arbitrary = do
    x <- arbitrary
    return $ Identity x

type IdAssoc = Identity Trivial -> Identity Trivial -> Identity Trivial -> Bool

-----------------------------------------------------------------------------
-- 3.
data Two a b = Two a b
  deriving (Eq, Show)

instance (Semigroup a, Semigroup b) => Semigroup (Two a b) where
  Two x y <> Two x' y' = Two (x <> x') (y <> y')

instance (Arbitrary a, Arbitrary b) => Arbitrary (Two a b) where
  arbitrary = do
    x <- arbitrary
    y <- arbitrary
    return $ Two x y

type TwoAssoc = Two Trivial Trivial
             -> Two Trivial Trivial
             -> Two Trivial Trivial
             -> Bool

-----------------------------------------------------------------------------
-- 4.
data Three a b c = Three a b c
  deriving (Eq, Show)

instance (Semigroup a, Semigroup b, Semigroup c)
      => Semigroup (Three a b c) where
  Three x y z <> Three x' y' z' = Three (x <> x') (y <> y') (z <> z')

instance (Arbitrary a, Arbitrary b, Arbitrary c)
      => Arbitrary (Three a b c) where
  arbitrary = do
    x <- arbitrary
    y <- arbitrary
    z <- arbitrary
    return $ Three x y z

type ThreeAssoc = Three Trivial Trivial Trivial
               -> Three Trivial Trivial Trivial
               -> Three Trivial Trivial Trivial
               -> Bool

-----------------------------------------------------------------------------
-- 5.
data Four a b c d = Four a b c d
  deriving (Eq, Show)

instance (Semigroup a, Semigroup b, Semigroup c, Semigroup d)
      => Semigroup (Four a b c d) where
  Four w x y z <> Four w' x' y' z' =
    Four (w <> w') (x <> x') (y <> y') (z <> z')

instance (Arbitrary a, Arbitrary b, Arbitrary c, Arbitrary d)
      => Arbitrary (Four a b c d) where
  arbitrary = do
    w <- arbitrary
    x <- arbitrary
    y <- arbitrary
    z <- arbitrary
    return $ Four w x y z

type FourAssoc = Four Trivial Trivial Trivial Trivial
              -> Four Trivial Trivial Trivial Trivial
              -> Four Trivial Trivial Trivial Trivial
              -> Bool

-----------------------------------------------------------------------------
-- 6.
newtype BoolConj = BoolConj Bool
  deriving (Eq, Show)

instance Semigroup BoolConj where
  BoolConj True  <> BoolConj True  = BoolConj True
  BoolConj False <> BoolConj _     = BoolConj False
  BoolConj True  <> BoolConj False = BoolConj False

instance Arbitrary BoolConj where
  arbitrary = elements [ BoolConj True
                       , BoolConj False
                       ]

type BoolConjAssoc = BoolConj
                  -> BoolConj
                  -> BoolConj
                  -> Bool


-----------------------------------------------------------------------------
-- 7.
newtype BoolDisj = BoolDisj Bool
  deriving (Eq, Show)

instance Semigroup BoolDisj where
  BoolDisj True  <> BoolDisj _     = BoolDisj True
  BoolDisj False <> BoolDisj True  = BoolDisj True
  BoolDisj False <> BoolDisj False = BoolDisj False

instance Arbitrary BoolDisj where
  arbitrary = elements [ BoolDisj True
                       , BoolDisj False
                       ]

type BoolDisjAssoc = BoolDisj
                  -> BoolDisj
                  -> BoolDisj
                  -> Bool


main :: IO ()
main = do
  quickCheck (semigroupAssoc :: TrivAssoc)
  quickCheck (semigroupAssoc :: IdAssoc)
  quickCheck (semigroupAssoc :: TwoAssoc)
  quickCheck (semigroupAssoc :: ThreeAssoc)
  quickCheck (semigroupAssoc :: FourAssoc)
  quickCheck (semigroupAssoc :: BoolConjAssoc)
  quickCheck (semigroupAssoc :: BoolDisjAssoc)
