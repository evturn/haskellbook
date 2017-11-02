-- 1.
-- Write a function which reduces an expression to a final sum.
data Expr = Lit Integer
          | Add Expr Expr
          deriving (Eq, Show)

eval :: Expr -> Integer
eval (Lit x)   = x
eval (Add x y) = (eval x) + (eval y)

-- 2.
-- Write a printer for the expressions.
printExpr :: Expr -> String
printExpr (Lit x)   = show x
printExpr (Add x y) = (printExpr x) ++ " + " ++ (printExpr y)
