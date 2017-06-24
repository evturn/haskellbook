import Data.Semigroup
import Test.QuickCheck

type Associativity x = x -> x -> x -> Bool
type S = String

semigroupAssoc :: (Eq m, Semigroup m) => Associativity m
semigroupAssoc a b c = (a <> (b <> c)) == ((a <> b) <> c)

-----------------------------
-- 1. Trivial
-----------------------------
data Trivial = Trivial deriving (Eq, Show)

instance Semigroup Trivial where
  _ <> _ = Trivial

instance Arbitrary Trivial where
  arbitrary = return Trivial

type TrivialAssoc = Trivial -> Trivial -> Trivial -> Bool

-----------------------------
-- 2. Identity
-----------------------------
newtype Identity a = Identity a deriving (Eq, Show)

instance Semigroup a => Semigroup (Identity a) where
  Identity x <> Identity y = Identity $ x <> y

instance Arbitrary a => Arbitrary (Identity a) where
  arbitrary = do
    a <- arbitrary
    return (Identity a)

type IdentityAssoc x = Associativity (Identity x)

-----------------------------
-- 3. Two
-----------------------------
data Two a b = Two a b deriving (Eq, Show)

instance (Semigroup a, Semigroup b) => Semigroup (Two a b) where
  Two x y <> Two p q = Two (x <> p) (y <> q)

instance (Arbitrary a, Arbitrary b) => Arbitrary (Two a b) where
  arbitrary = do
    a <- arbitrary
    b <- arbitrary
    return (Two a b)

type TwoAssoc a b = Associativity (Two a b)

-----------------------------
-- 4. Three
-----------------------------
data Three a b c = Three a b c deriving (Eq, Show)

instance (Semigroup a, Semigroup b, Semigroup c) => Semigroup (Three a b c) where
  Three x y z <> Three p q r = Three (x <> p) (y <> q) (z <> r)

instance (Arbitrary a, Arbitrary b, Arbitrary c) => Arbitrary (Three a b c) where
  arbitrary = do
    a <- arbitrary
    b <- arbitrary
    c <- arbitrary
    return (Three a b c)

type ThreeAssoc a b c = Associativity (Three a b c)

-----------------------------
-- 5. Four
-----------------------------
data Four a b c d = Four a b c d deriving (Eq, Show)

instance (Semigroup a, Semigroup b, Semigroup c, Semigroup d) => Semigroup (Four a b c d) where
  Four w x y z <> Four ww xx yy zz = Four (w <> ww) (x <> xx) (y <> yy) (z <> zz)

instance (Arbitrary a, Arbitrary b, Arbitrary c, Arbitrary d) => Arbitrary (Four a b c d) where
  arbitrary = do
    a <- arbitrary
    b <- arbitrary
    c <- arbitrary
    d <- arbitrary
    return (Four a b c d)

type FourAssoc a b c d = Associativity (Four a b c d)

-----------------------------
-- 6. Conjunction
-----------------------------
newtype BoolConj = BoolConj Bool deriving (Eq, Show)

instance Semigroup BoolConj where
  BoolConj x <> BoolConj y = BoolConj (x && y)

instance Arbitrary BoolConj where
  arbitrary = do
    a <- arbitrary
    return (BoolConj a)

type ConjAssoc = Associativity BoolConj

-----------------------------
-- 7. Disconjuntion
-----------------------------
newtype BoolDisj = BoolDisj Bool deriving (Eq, Show)

instance Semigroup BoolDisj where
  BoolDisj True <> BoolDisj _  = BoolDisj True
  BoolDisj False <> BoolDisj x = BoolDisj x

instance Arbitrary BoolDisj where
  arbitrary = do
    a <- arbitrary
    return (BoolDisj a)

type DisjAssoc = Associativity BoolDisj

-----------------------------
-- 8. Or
-----------------------------
data Or a b = Fst a | Snd b deriving (Eq, Show)

instance (Semigroup a, Semigroup b) => Semigroup (Or a b) where
  Fst _ <> Snd y = Snd y
  Fst _ <> Fst y = Fst y
  Snd x <> Fst _ = Snd x
  Snd x <> Snd _ = Snd x

-- instance (Semigroup a, Semigroup b) => Semigroup (Or a b) where
--   (Snd a) <> _ = Snd a
--   _ <> (Snd a) = (Snd a)
--   _ <> b = b



-- instance (Arbitrary a, Arbitrary b) => Arbitrary (Or a b) where
--   arbitrary = do
--     a <- arbitrary
--     b <- arbitrary
--     return (Or a b)

instance (Arbitrary a, Arbitrary b) => Arbitrary (Or a b) where
  arbitrary = do
    a <- arbitrary
    b <- arbitrary
    elements [(Fst a), (Snd b)]

type OrAssoc a b = Associativity (Or a b)


main :: IO ()
main = do
  putStrLn "\n1. Trivial"
  quickCheck (semigroupAssoc :: TrivialAssoc)

  putStrLn "\n2. Identity"
  quickCheck (semigroupAssoc :: IdentityAssoc S)

  putStrLn "\n3. Two"
  quickCheck (semigroupAssoc :: TwoAssoc S S)

  putStrLn "\n4. Three"
  quickCheck (semigroupAssoc :: ThreeAssoc S S S)

  putStrLn "\n5. Four"
  quickCheck (semigroupAssoc :: FourAssoc S S S S)

  putStrLn "\n6. Conjunction"
  quickCheck (semigroupAssoc :: ConjAssoc)

  putStrLn "\n7. Disjunction"
  quickCheck (semigroupAssoc :: DisjAssoc)

  putStrLn "\n8. Or"
  quickCheck (semigroupAssoc :: OrAssoc S S)

