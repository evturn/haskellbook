data Rocks = Rocks String
  deriving (Eq, Show)

data Yeah = Yeah Bool
  deriving (Eq, Show)

data Papu = Papu Yeah
  deriving (Eq, Show)

-----------------------------------------------------------------------------
-- 1.
-- phew = Papu "chases" True
--
-- Answer: error - the second argument should be of type `Yeah` which itself
--                 should contain a value of type `Bool`

-----------------------------------------------------------------------------
-- 2.
-- truth = Papu (Rocks "chomskydoz") (Yeah True)
--
-- Answer: error - there is one too many arguments

-----------------------------------------------------------------------------
-- 3.
equalityForall :: Papu -> Papu -> Bool
equalityForall p p' = p == p'
--
-- Answer: Typechecks.

-----------------------------------------------------------------------------
-- 4.
-- comparePapus :: Papu -> Papu -> Bool
-- comparePapus p p' = p > p'
--
-- Answer: error - no instance of `Ord`
