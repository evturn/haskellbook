{-# LANGUAGE OverloadedStrings #-}

module Main where

import           Control.Monad.IO.Class
import           Control.Monad.Trans.Class
import           Control.Monad.Trans.Reader
import           Data.IORef
import qualified Data.Map                   as M
import           Data.Maybe                 (fromMaybe)
import           Data.Text.Lazy             (Text)
import qualified Data.Text.Lazy             as TL
import           System.Environment         (getArgs)
import           Web.Scotty.Trans

data Config = Config
    { counts :: IORef (M.Map Text Integer)
    , prefix :: Text
    }

type Scotty  = ScottyT Text (ReaderT Config IO)
type Handler = ActionT Text (ReaderT Config IO)

bumpBoomp :: Text -> M.Map Text Integer -> (M.Map Text Integer, Integer)
bumpBoomp k m = (M.insert k incInt m, incInt)
  where
    incInt = fromMaybe 0 (M.lookup k m) + 1

app :: Scotty ()
app = get "/:key" $ do
  unprefixed <- param "key"
  config     <- lift $ ReaderT return
  let key' = mappend (prefix config) unprefixed
  n <- liftIO $ do
    m <- readIORef (counts config)
    let (m', n) = bumpBoomp key' m
    writeIORef (counts config) m'
    return n
  html $ mconcat [ "<h1>Success! Count was: "
                 , TL.pack $ show n
                 , "</h1>"
                 ]

main :: IO ()
main = do
  [prefixArg] <- getArgs
  counter <- newIORef M.empty
  let config = Config counter (TL.pack prefixArg)
      runR r = runReaderT r config
  scottyT 3000 runR app
