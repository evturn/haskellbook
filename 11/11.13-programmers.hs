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
