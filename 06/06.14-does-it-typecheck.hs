-- 1.
data Person = Person Bool

instance Show Person where
  show (Person x) = show x

printPerson :: Person -> IO ()
printPerson person = putStrLn (show person)

-----------------------------------------------------------------------------
-- 2.
data Mood = Blah
          | Woot
          deriving Show

instance Eq Mood where
  (==) Blah Blah = True
  (==) Woot Woot = True
  (==) _ _       = False

settleDown :: Mood -> Mood
settleDown x = if x == Woot
               then Blah
               else x

-----------------------------------------------------------------------------
-- 3.
-- If you were able to get `settleDown` to typecheck:
--
-- a) What values are acceptable inputs to that function?
-- Answer: `Blah` or `Woot`
--
-- b) What will happen if you try to run `settleDown 9`?
-- Answer: error - argument must be of type `Mood`
--
-- c) What will happen if you try to run `Blah > Woot`?
-- Answer: error - no instance for `Ord`

-----------------------------------------------------------------------------
-- 4.
type Subject = String
type Verb    = String
type Object  = String

data Sentence = Sentence   Subject Verb Object
              | Incomplete Subject Verb
  deriving (Eq, Show)

s1 :: Sentence
s1 = Incomplete "dogs" "drool" -- previously missing an argument

s2 :: Sentence
s2 = Sentence "Julie" "loves" "dogs"
