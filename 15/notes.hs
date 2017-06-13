-- ‘Algebra’ means the study of mathematical symbols and the rules governing their manipulation.
-- It is differentiated from arithmetic by its use of abstractions such as variables.
-- Variables represent the rules of how to manipulate this thing without reference to its particular value.

-- 'An algebra' refers to some operations and the set they operate over.

-- Algebras are implemented with typeclasses.
   -- The typeclasses define the set of operations.
      -- A set is the type the operations are for.
      -- The instance defines how each operation will perform for a given type or set.

-- A mondoid is a binary associative operation with an identity.
--     [1]          [2]      [3]         [4]              [5]
--
-- 1. What will end up being the name of the typeclass.
--
-- 2. Binary - There will be two of something.
--
-- 3. Associative - This is a property or law that must be satisfied.
--
-- 4. Operation - In mathematics, this is usually an infix operator.
      -- Interchangably a function with two (binary) arugments.
--
-- 5. Identity - Some value when combined with any other value will always return that other value.

-- A monoid is a function that takes two arguments and follows two laws: associativity and identity.
   -- Associativity means arguments can be regrouped (or reparenthesized) in different orders
   -- and give the same result (as in addition).
   --
   -- Identity means there exists some value such that when we pass it as input to our function,
   -- the operation is rendered moot and the other value is returned (such as adding zero).
   --
   -- `Monoid` is the typeclass that generalizes these laws across types.

-- Mappending is best thought of not as a way of combining values in the way addition
-- or list concatenation does, but as a way to condense any set of values to a summary value.


-- Semigroup
-- To get from a monoid to a semigroup, we simply no longer furnish nor require an identity.
-- Data constructors with only non-alphanumeric symbols and that begin with a colon are infix by default;
   -- those with alphanumeric names are prefix by default.
-- Beyond this, you use NonEmpty just like you would a list, but what you’ve gained is being explicit
   -- that having zero values is not valid for your use-case.
-- Anything which is a Monoid is by definition also a semigroup.
-- Polymorphism isn’t only useful for reusing code; it’s also useful for expressing intent through
   -- parametricity so that people reading the code know what we meant to accomplish.