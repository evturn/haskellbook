-- Write a function that generates all possible values of `Programmer`.
data OperatingSystem = GnuPlusLinux
                     | OpenBSDPlusNevermindJustBSDStill
                     | Mac
                     | Windows
                     deriving (Eq, Show)

data ProgrammingLanguage = Haskell
                         | Agda
                         | Idris
                         | PureScript
                         deriving (Eq, Show)

data Programmer = Programmer
    { os   :: OperatingSystem 
    , lang :: ProgrammingLanguage 
    } deriving (Eq, Show)

nineToFive :: Programmer
nineToFive = Programmer { os   = Mac 
                        , lang = Haskell }

feelingWizardly :: Programmer
feelingWizardly = Programmer { lang = Agda
                             , os   = GnuPlusLinux }

allOperatingSystems :: [OperatingSystem]
allOperatingSystems =
  [ GnuPlusLinux
  , OpenBSDPlusNevermindJustBSDStill
  , Mac
  , Windows
  ]

allLanguages :: [ProgrammingLanguage]
allLanguages =
  [ Haskell
  , Agda
  , Idris
  , PureScript 
  ]

allProgrammers :: [Programmer]
allProgrammers = [Programmer { lang = x, os = y } | x <- allLanguages,
                                                    y <- allOperatingSystems]

-----------------------------------------------------------------------------
--
-- Deconstructing values
--
-----------------------------------------------------------------------------
newtype Name = Name String
  deriving Show

newtype Acres = Acres Int 
  deriving Show

data FarmerType = DairyFarmer
                | WheatFarmer
                | SoybeanFarmer
                deriving Show

data Farmer = Farmer Name Acres FarmerType
  deriving Show

isDairyFarmer :: Farmer -> Bool
isDairyFarmer (Farmer _ _ DairyFarmer) = True
isDairyFarmer _                        = False

data FarmerRec = FarmerRec
    { name       :: Name
    , acres      :: Acres
    , farmerType :: FarmerType 
    } deriving Show

isDairyFarmerRec :: FarmerRec -> Bool
isDairyFarmerRec farmer = case farmerType farmer of
                            DairyFarmer -> True
                            _           -> False

-----------------------------------------------------------------------------
--
-- Accidental bottoms from records
--
-----------------------------------------------------------------------------
data Car = Car 
    { make  :: String
    , model :: String
    , year  :: Integer
    } deriving (Eq, Show)

data Automobile = Null
                | Automobile Car
                deriving (Eq, Show)
