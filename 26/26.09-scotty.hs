{-# LANGUAGE OverloadedStrings #-}

module Scotty where

import           Control.Monad.Trans.Class
import           Data.Monoid               (mconcat)
import           Web.Scotty
import           Web.Scotty.Internal.Types (ActionT (..))

main = scotty 3000 $ do
  get "/:word" $ do
    beam <- param "word"
    ActionT . lift . lift .lift $ putStrLn "hello"
    html $ mconcat [ "<h1>Scotty, "
                   , beam
                   , " me up!</h1>"
                   ]
