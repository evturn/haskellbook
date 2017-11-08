import           Test.QuickCheck

-----------------------------------------------------------------------------
-- 1.
data Fool = Fulse
          | Frue
          deriving (Eq, Show)

genEqualFoolDatatypes :: Gen Fool
genEqualFoolDatatypes = elements [Fulse, Frue]

-----------------------------------------------------------------------------
-- 2.
genThirdFoolDatatypes :: Gen Fool
genThirdFoolDatatypes = do
  frequency [ (2, return $ Fulse)
            , (1, return $ Frue)
            ]

main :: IO ()
main = do
  putStrLn "1. Equal probability of Fool datatypes"
  sample genEqualFoolDatatypes
  putStrLn "1. 2/3 Fulse 1/13 Frue probability of Fool datatypes"
  sample genThirdFoolDatatypes

