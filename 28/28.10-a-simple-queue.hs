data Queue a = Queue
    { enqueue :: [a]
    , dequeue :: [a]
    } deriving (Eq, Show)

push :: a -> Queue a -> Queue a
push x q = case enqueue q of
  [] -> Queue [] $ [x]
  xs -> Queue [x] $ xs

pop :: Queue a -> Maybe (a, Queue a)
pop q = case dequeue q of
  []     -> Nothing
  (x:xs) -> Just (x, Queue [] $ xs)
