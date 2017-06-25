import Data.Int

data BigSmall = Big Bool
              | Small Bool
              deriving (Eq, Show)

data NumberOrBool = Numz Int8
                  | BoolyBool Bool
                  deriving (Eq, Show)

numz = Numz (-128)