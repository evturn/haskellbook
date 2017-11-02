data Expr = Lit Integer
          | Add Expr Expr
          deriving (Eq, Show)

eval :: Expr -> Integer
eval (Lit x)   = x
eval (Add x y) = (eval x) + (eval y)
