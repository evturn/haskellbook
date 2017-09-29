-- 1.
-- The Eq class
-- c) makes equality tests possible

-- 2.
-- The typeclass Ord
-- b) is a subclass of Eq

-- 3.
-- What is the type of >?
-- a) Ord a => a -> a -> Bool

-- 4.
-- In x = divMod 16 12
-- d) the type of x is a tuple

-- 5.
-- The typeclass Integral includes
-- a) Int and Integer numbers

-- Does it typecheck?
-- 1.
-- No, needed to derive Show.
data Person = 
  Person Bool
  deriving (Show)

printPerson :: Person -> IO ()
printPerson person = putStrLn (show person)

-- 2.
-- No, needed to derive Eq.
data Mood =
    Blah
  | Woot
  deriving (Eq, Show)

settleDown x = if x == Woot
                  then Blah
                  else x

-- 3.
-- a. Acceptable inputs must be of type Mood
-- b. Error. Cannot compare type Mood to type Num
-- c. Error. Needs instance of Ord.

-- 4.
-- Typechecks, although s1 hasn't applied an argument for Object constructor 
type Subject = String
type Verb = String
type Object = String

data Sentence =
  Sentence Subject Verb Object
  deriving (Eq, Show)

s1 = Sentence "dogs" "drool"
s2 = Sentence "Julie" "loves" "dogs"


-- Given a datatype declaration, what can we do?

data Rocks =
  Rocks String deriving (Eq, Show)

data Yeah =
  Yeah Bool deriving (Eq, Show)

data Papu =
  Papu Rocks Yeah deriving (Eq, Show)

-- 1.
-- No, concrete values were provided for Papu datatype
-- phew = Papu "chases" True
phew = Papu (Rocks "chases") (Yeah True)

-- 2.
-- Typechecks.
truth = Papu (Rocks "chomskydoz") (Yeah True)

-- 3.
-- Typechecks.
equalityForall :: Papu -> Papu -> Bool
equalityForall p p' = p == p'

--4. 
-- No, does not has an instance of Ord
comparePapus :: Papu -> Papu -> Bool
comparePapus p p' = p > p'


-- Match the types
-- 1.
-- No, literal 1 does not have an instance of Num

-- 2.
-- No, f already has the type Float

-- 3.
-- Yes, Fractional is superclass of Float

-- 4.
-- Yes, RealFrac is superclass of Float

-- 5.
-- Yes, the identity function leaves everything unchanged
 
-- 6.
-- Yes, the identity function

-- 7.
-- No, myX cannot be made more polymorphic from Int -> a

-- 8.
-- No, myX cannot be made more polymorphic from Int -> Num

-- 9.
-- Yes, Int has an instance of Ord

-- 10.
-- Yes, both signatures will work

-- 11.
-- No, use for the typeclass method calls for more specific type constraints
