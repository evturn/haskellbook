# 04
##### Basic Types

<hr><hr>
## Types
</br>

##### Types are similar in regards to Set theory. 
- Set theory is the study of mathematical collections of objects. 
- Set theory was a precursor to type theory. 
- Set theory was used prolifically in the design of programming languages like Haskell. 
- Logical operations like disjunction (or) and conjunction (and) used in the manipulation of sets have equivalents in Haskell’s type system.

<hr><hr>
## Tuple
</br>
- An ordered grouping of values. 
- You cannot have a tuple with only one element, but there is a zero tuple also called unit or (). 
- The types of the elements of tuples are allowed to vary, so you can have both (String, String) or (Integer, String). 
- Tuples are the usual means of expressing an anonymous product.

<hr><hr>
## Typeclass
</br>

- A set of operations defined with respect to a polymorphic type. 
- When a type is an instance of a typeclass, values of that type can be used in the standard operations defined for that typeclass. 
- Are unique pairings of class and concrete instance.

<hr><hr>
## Data constructors
</br>

- A means of creating values that inhabit a given type. 
- Have a type and can either be constant values (nullary) or take one or more arguments just like functions.

`Cat` is a nullary data constructor for `Pet` and `Dog` is a data constructor that takes an argument:

```haskell

type Name = String

data Pet = Cat | Dog Name

:t Cat
Cat :: Pet

:t Dog
Dog :: Name -> Pet
```

<hr><hr>
## Type constructors
</br>

- Are not values and can only be used in type signatures. 
- Data declarations generate type constructors which can be used to denote that type.

<hr><hr>
## Data declarations
</br>

- Define new datatypes in Haskell. 
- Data declarations always create a new type constructor, but may or may not create new data constructors. 
- Data declarations are how we refer to the entire definition that begins with the data keyword.

<hr><hr>
## Type alias
</br>

- A way to refer to a type constructor or type constant by an alternate name.

<hr><hr>
## Polymorphism
</br>

- Being able to write code in terms of values which may be one of several, or any, type. 
- Is either `parametric` or `constrained`.