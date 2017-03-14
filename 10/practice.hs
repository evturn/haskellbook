--Folds

-- A concept that extends in usefulness and importance beyond lists.
-- They are catamorphisms which are a means of deconstructing data.

-- Folding happens in two stages: traversal and folding.
  -- Traversal is the stage in which the fold recurses over the spine.
  -- Folding refers to the evaluation or reduction of the folding function applied to the values.

-- foldr f z (x:xs) = f x (foldr f z xs)
--                        ^------------^
--                       rest of the fold


-- foldr :: (a -> b -> b) -> b -> [a] -> b
--          [1]  [2]  [3]

-- 1. One of the list element arguments to the folding function.
-- 2. Either be the start/accumulator value.
-- 3. The result of having combined the list element and the start/accumulator value after a fold.

-- foldl :: (b -> a -> b) -> b -> [a] -> b
--          [4]  [5]  [6]

-- 4. Either be the start/accumulator value.
-- 5. One of the list element arguments to the folding function.
-- 6. The result of having combined the list element and the start/accumulator value after a fold.

-- foldl (flip (*)) 1 [1..3]
-- 1 * 1
-- 2 * 1
-- 3 * 2