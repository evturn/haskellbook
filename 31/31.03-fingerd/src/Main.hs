{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
{-# LANGUAGE RecordWildCards   #-}

module Main where

import           Control.Exception
import           Control.Monad                (forever)
import           Data.ByteString              (ByteString)
import qualified Data.ByteString              as BS
import           Data.List                    (intersperse)
import           Data.Text                    (Text)
import qualified Data.Text                    as T
import           Data.Text.Encoding           (decodeUtf8, encodeUtf8)
import           Data.Typeable
import qualified Database.SQList.Simple       as SQLite
import           Database.SQLite.Simple       hiding (close)
import           Database.SQLite.Simple.Types
import           Network.Socket               hiding (close, recv)
import           Network.Socket.ByteString    (recv, sendAll)
import           Text.RawString.QQ



main :: IO ()
main = do
  putStrLn "For store hours press 4"
