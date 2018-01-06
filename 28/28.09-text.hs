module Main where

import           Control.Monad
import qualified Data.Text         as T
import qualified Data.Text.IO      as TIO
import qualified Data.Text.Lazy    as TL
import qualified Data.Text.Lazy.IO as TLIO
import qualified System.IO         as SIO

dictWords :: IO String
dictWords = SIO.readFile "/usr/share/dict/words"

dictWordsT :: IO T.Text
dictWordsT = TIO.readFile "/usr/share/dict/words"

dictWordsTL :: IO TL.Text
dictWordsTL = TLIO.readFile "/usr/share/dict/words"

main :: IO ()
main = do
  replicateM_ 1000 (dictWords   >>= print)
  replicateM_ 1000 (dictWordsT  >>= TIO.putStrLn)
  replicateM_ 1000 (dictWordsTL >>= TLIO.putStrLn)
