import Control.Applicative

-- lookup :: Eq a => a -> [(a, b)] -> Maybe b
f x = lookup x [(3, "hello"), (4, "julie"), (5, "kbai")]
g y = lookup y [(7, "sup?"), (8, "chris"), (9, "aloha")]

h z = lookup z [(2, 3), (5, 6), (7, 8)]
m x = lookup x [(4, 10), (8, 13), (1, 9001)]

-- ∨ -------------------------------- ∨ ---------------------------------- ∨ --
-- Prelude> f 3
-- Just "hello"

-- Prelude> g 8
-- Just "chris"

-- Prelude> (++) <$> f 3 <*> g 7
-- Just "hellosup?"

-- Prelude> (+) <$> h 5 <*> m 1
-- Just 9007

-- Prelude> (+) <$> h 5 <*> m 6
-- Nothing
-- ∧ -------------------------------- ∧ ---------------------------------- ∧ --
