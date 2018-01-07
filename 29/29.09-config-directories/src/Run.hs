module Run where

import           Data.List          (isSuffixOf)
import qualified Data.Map           as M
import           Parser
import           System.Directory
import           System.Environment

type Entry = M.Map FilePath String

selectConfigs :: [String] -> [String]
selectConfigs = filter (isSuffixOf ".ini")

readC :: FilePath -> IO Entry -> IO Entry
readC x iomp = do
  v <- readFile x
  mp <- iomp
  return $ M.insert x v mp

ls :: IO ()
ls = do
  [x] <- getArgs
  paths <- listDirectory x
  files <- return $ selectConfigs paths
  mp <- foldr readC (return M.empty) files
  print mp


