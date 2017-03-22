-- Sum of products

-- 2 * (3 + 4)
--   2 * (7)
--     14

-- with multiplication distributed over the addition
-- 2 * 3 + 2 * 4
--   (6) + (8)
--     14

--generalizing the distributive property
-- a * (b + c) -> (a * b) + (a * c)

data Fiction = Fiction deriving Show
data Nonfiction = Nonfiction deriving Show

data BookType = FictionBook Fiction
              | NonfictionBook Nonfiction
              deriving Show

-- `Fiction` and `Nonfiction`
-- two types with only single, nullary inhabitants.

-- `BookType`
-- sum type with constructors that take the `Fiction` and `Nonfiction` types as arguments.

type AuthorName = String

-- data Author = Author (AuthorName, BookType)

data Author =
    Fiction AuthorName
  | Nonfiction AuthorName
  deriving (Eq, Show)

data Expr =
    Number Int
  | Add Expr Expr
  | Minus Expr
  | Mult Expr Expr
  | Divide Expr Expr

-- The previous datatype with stricter interpretation of normal form would require
-- representing products with tuples and sums with `Either`, like so:

type Number = Int
type Add = (Expr, Expr)
type Minus = Expr
type Mult = (Expr, Expr)
type Divide = (Expr, Expr)

type Expr =
  Either Number
    (Either Add
      (Either Minus
        (Either Mult Divide)))


data FlowerType = Gardenia
                | Daisy
                | Rose
                | Lilac
                deriving Show

type Gardener = String

data Garden =
  Garden Gardener FlowerType
  deriving Show

-- Normal form of `Garden` would be

data Garden = Gardenia Gardener
            | Daisy Gardener
            | Rose Gardener
            | Lilac Gardener
            deriving Show


type JavaScript = String
type ObjectiveC = String
type Haskell    = String
type Go         = String
type Python     = String

data ProgrammingLanguage = JavaScript
                         | ObjectiveC
                         | Haskell
                         | Go
                         | Python
                         deriving Show

type Engineer = String

data SoftwareEngineer = (Engineer, ProgrammingLanguage)
  deriving Show