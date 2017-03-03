-- List comprehensions are a means of generating new lists from a list or lists.
-- They come directly from the concept of set comprehensions in mathematics.
-- They must have a list one list called the generator.
  -- The generator gives the input for the comprehension which provides the set of items from
--   which the new list will be constructed.
  -- They may have conditions to determine which elements are drawn from the list and/or functions
--   applied to those elements.

-- [ x^2 ]  |  x <- [1..10]]
--   [1]   [2]    [   3  ]

-- 1. This is the output function that will apply to the members of the list we indicate.
-- 2. The pipe here designates the separation between the output function and the input.
-- 3. The input set:
  -- A generator list and a variable that represents the elements that will be drawn from that list.
  -- In this case "from a list of numbers from 1-10, take (<-) each element as an input to the
--   output function"

-- In plain English, that list comprehension will produce a new list that includes the square of
-- every number from 1 to 10.

doIt = [x^2 | x <- [1..10]]
-- [1,4,9,16,25,36,49,64,81,100]

-- Adding predicates
--
-- List comprehensions optionally take predicates limiting elements drawn from the generator list.
-- The predicate must evaluate to Bool values.

doItWithOnlyEvens = [x^2 | x <- [1..10], rem x 2 == 0]
-- [4,16,36,64,100]

doItWithPowers = [x^y | x <- [1..5], y <- [2, 3]]
-- [1,1,4,8,9,27,16,64,25,125]

doItWithPowersLessThan200 = [x^y | x <- [1..10], y <- [2, 3], x^y < 200]
-- [1,1,4,8,9,27,16,64,25,125,36,49,64,81,100]

doItWithTuples = [(x, y) | x <- [1, 2, 3], y <- [6, 7]]
-- [(1,6), (1,7), (2,6), (2,7), (3, 6), (3,7)]

doItWithTuplesOfDiffType = [(x, y) | x <- [1, 2 ,3], y <- ['a', 'b']]
-- [(1,'a'), (1,'b'), (2,'a'), (2,'b'), (3,'a'), (3,'b')]

mySqr = [x^2 | x <- [1..5]]
myCube = [y^3 | y <- [1..5]]

doItNestedGenerators = [(x, y) | x <- mySqr, y <- [1..3], x < 4]

basketball = [x | x <- "National Basketball Association", elem x ['A'..'Z']]

acro xs = [x | x <- xs, elem x ['A'..'Z']]

sqrCubeTuples = [(x, y) | x <- mySqr, y <- myCube]

sqrCubeTuplesLessThan50 = [(x, y) | x <- mySqr, y <- myCube, x < 50, y < 50]