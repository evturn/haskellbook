import           Data.Monoid     hiding ((<>))
import           Data.Semigroup
import           Test.QuickCheck hiding (Failure, Success)

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

-----------------------------------------------------------------------------
-- 8.
data Or a b = Fst a
            | Snd b
            deriving (Eq, Show)

instance (Semigroup a, Semigroup b) => Semigroup (Or a b) where
  Fst x <> Fst y = Fst y
  Fst x <> Snd y = Snd y
  Snd x <> Snd y = Snd x
  Snd x <> Fst y = Snd x

instance (Arbitrary a, Arbitrary b) => Arbitrary (Or a b) where
  arbitrary = do
    x <- arbitrary
    y <- arbitrary
    elements [ Fst x
             , Snd y
             ]

type OrAssoc = Or Trivial Trivial
            -> Or Trivial Trivial
            -> Or Trivial Trivial
            -> Bool


-----------------------------------------------------------------------------
-- 9.
-- This does not work.
newtype Combine a b = Combine
                    { unCombine :: (a -> b) }

instance Show (Combine a b) where
  show (Combine f) = "Combine (a -> b)"

instance Semigroup b => Semigroup (Combine a b) where
  Combine f <> Combine g = Combine (\x -> f x <> g x)

instance (CoArbitrary a, Arbitrary b) => Arbitrary (Combine a b) where
  arbitrary = do
    f <- arbitrary
    return $ Combine f

type CombAssoc = Combine Int (String -> String)
              -> Combine Int (String -> String)
              -> Combine Int (String -> String)
              -> Bool

-----------------------------------------------------------------------------
-- 10.
-- This does not work.
newtype Comp a = Comp
               { unComp :: (a -> a) }

instance Semigroup a => Semigroup (Comp a) where
  Comp f <> Comp g = Comp (f . g)

instance (CoArbitrary a, Arbitrary a) => Arbitrary (Comp a) where
  arbitrary = do
    x <- arbitrary
    return $ Comp x

type CompAssoc = Comp Int
              -> Comp Int
              -> Comp Int
              -> Bool

-----------------------------------------------------------------------------
-- 11.
data Validation a b = Failure a
                    | Success b
                    deriving (Eq, Show)

instance Semigroup a => Semigroup (Validation a b) where
  Success x <> Failure y = Success x
  Failure x <> Failure y = Failure (x <> y)
  Success x <> Success y = Success x
  Failure x <> Success y = Success y

instance (Arbitrary a, Arbitrary b) => Arbitrary (Validation a b) where
  arbitrary = do
    x <- arbitrary
    y <- arbitrary
    elements [ Failure x
             , Success y
             ]

type ValidAssoc = Validation String Int
               -> Validation String Int
               -> Validation String Int
               -> Bool

runValidation :: IO ()
runValidation = do
  let failure :: String -> Validation String Int
      failure = Failure
      success :: Int -> Validation String Int
      success = Success
  print $ success 1      <> failure "blah"
  print $ failure "woot" <> failure "blah"
  print $ success 1      <> success 2
  print $ failure "woot" <> success 2

-----------------------------------------------------------------------------

main :: IO ()
main = do
  quickCheck (semigroupAssoc :: TrivAssoc)
  quickCheck (semigroupAssoc :: IdAssoc)
  quickCheck (semigroupAssoc :: TwoAssoc)
  quickCheck (semigroupAssoc :: ThreeAssoc)
  quickCheck (semigroupAssoc :: FourAssoc)
  quickCheck (semigroupAssoc :: BoolConjAssoc)
  quickCheck (semigroupAssoc :: BoolDisjAssoc)
  quickCheck (semigroupAssoc :: OrAssoc)
  -- quickCheck (semigroupAssoc :: CombAssoc) ?
  -- quickCheck (semigroupAssoc :: CompAssoc) ?
  quickCheck (semigroupAssoc :: ValidAssoc)
