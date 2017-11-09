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
-- 3.
data Two a b = Two a b
  deriving (Eq, Show)

instance (Semigroup a, Semigroup b) => Semigroup (Two a b) where
  Two x y <> Two x' y' = Two (x <> x') (y <> y')

instance ( Semigroup a, Monoid a
         , Semigroup b, Monoid b
         ) => Monoid (Two a b) where
  mempty  = Two mempty mempty
  mappend = (<>)

instance (Arbitrary a, Arbitrary b) => Arbitrary (Two a b) where
  arbitrary = do
    x <- arbitrary
    y <- arbitrary
    return $ Two x y

type TwoAssoc = Two Trivial Trivial
             -> Two Trivial Trivial
             -> Two Trivial Trivial
             -> Bool
type TwoId   = Two String String -> Bool

-----------------------------------------------------------------------------
-- 3.1.
data Three a b c = Three a b c
  deriving (Eq, Show)

instance ( Semigroup a
         , Semigroup b
         , Semigroup c
         ) => Semigroup (Three a b c) where
  Three x y z <> Three x' y' z' = Three (x <> x') (y <> y') (z <> z')


instance ( Semigroup a, Monoid a
         , Semigroup b, Monoid b
         , Semigroup c, Monoid c
         ) => Monoid (Three a b c) where
  mempty  = Three mempty mempty mempty
  mappend = (<>)

instance ( Arbitrary a
         , Arbitrary b
         , Arbitrary c
         ) => Arbitrary (Three a b c) where
  arbitrary = do
    x <- arbitrary
    y <- arbitrary
    z <- arbitrary
    return $ Three x y z

type ThreeAssoc = Three Trivial Trivial Trivial
               -> Three Trivial Trivial Trivial
               -> Three Trivial Trivial Trivial
               -> Bool
type ThreeId    = Three String String String -> Bool

-----------------------------------------------------------------------------
-- 3.2.
data Four a b c d = Four a b c d
  deriving (Eq, Show)

instance ( Semigroup a
         , Semigroup b
         , Semigroup c
         , Semigroup d
         ) => Semigroup (Four a b c d) where
  Four w x y z <> Four w' x' y' z' =
    Four (w <> w') (x <> x') (y <> y') (z <> z')

instance ( Semigroup a, Monoid a
         , Semigroup b, Monoid b
         , Semigroup c, Monoid c
         , Semigroup d, Monoid d
         ) => Monoid (Four a b c d) where
  mempty  = Four mempty mempty mempty mempty
  mappend = (<>)

instance ( Arbitrary a
         , Arbitrary b
         , Arbitrary c
         , Arbitrary d
         ) => Arbitrary (Four a b c d) where
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
type FourId    = Four String String String String -> Bool

-----------------------------------------------------------------------------
-- 5.
newtype BoolConj = BoolConj Bool
  deriving (Eq, Show)

instance Semigroup BoolConj where
  BoolConj True  <> BoolConj True  = BoolConj True
  BoolConj False <> BoolConj _     = BoolConj False
  BoolConj True  <> BoolConj False = BoolConj False

instance Monoid BoolConj where
  mempty  = BoolConj True
  mappend = (<>)

instance Arbitrary BoolConj where
  arbitrary = elements [ BoolConj True
                       , BoolConj False
                       ]

type BoolConjAssoc = BoolConj
                  -> BoolConj
                  -> BoolConj
                  -> Bool
type BoolConjId    = BoolConj -> Bool

-----------------------------------------------------------------------------
-- 5.
newtype BoolDisj = BoolDisj Bool
  deriving (Eq, Show)

instance Semigroup BoolDisj where
  BoolDisj True  <> BoolDisj _     = BoolDisj True
  BoolDisj False <> BoolDisj True  = BoolDisj True
  BoolDisj False <> BoolDisj False = BoolDisj False

instance Monoid BoolDisj where
  mempty  = BoolDisj False
  mappend = (<>)

instance Arbitrary BoolDisj where
  arbitrary = elements [ BoolDisj True
                       , BoolDisj False
                       ]

type BoolDisjAssoc = BoolDisj
                  -> BoolDisj
                  -> BoolDisj
                  -> Bool
type BoolDisjId    = BoolDisj -> Bool

main :: IO ()
main = do
  putStrLn "1. Trivial"
  quickCheck (semigroupAssoc      :: TrivAssoc)
  quickCheck (monoidLeftIdentity  :: TrivId)
  quickCheck (monoidRightIdentity :: TrivId)
  putStrLn "2. Identity"
  quickCheck (semigroupAssoc      :: IdAssoc)
  quickCheck (monoidLeftIdentity  :: IdId)
  quickCheck (monoidRightIdentity :: IdId)
  putStrLn "3. Two"
  quickCheck (semigroupAssoc      :: TwoAssoc)
  quickCheck (monoidLeftIdentity  :: TwoId)
  quickCheck (monoidRightIdentity :: TwoId)
  putStrLn "3.1. Three"
  quickCheck (semigroupAssoc      :: ThreeAssoc)
  quickCheck (monoidLeftIdentity  :: ThreeId)
  quickCheck (monoidRightIdentity :: ThreeId)
  putStrLn "3.2. Four"
  quickCheck (semigroupAssoc      :: FourAssoc)
  quickCheck (monoidLeftIdentity  :: FourId)
  quickCheck (monoidRightIdentity :: FourId)
  putStrLn "4. BoolConj"
  quickCheck (semigroupAssoc      :: BoolConjAssoc)
  quickCheck (monoidLeftIdentity  :: BoolConjId)
  quickCheck (monoidRightIdentity :: BoolConjId)
  putStrLn "5. BoolDisj"
  quickCheck (semigroupAssoc      :: BoolDisjAssoc)
  quickCheck (monoidLeftIdentity  :: BoolDisjId)
  quickCheck (monoidRightIdentity :: BoolDisjId)
