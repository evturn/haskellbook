newtype Reader r a = Reader
                   { runReader :: a -> r }

ask :: Reader a a
ask = Reader id
