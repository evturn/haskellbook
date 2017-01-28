# 02
##### Expressions

<hr><hr>
## The Lambda Calculus
##### Everything in Haskell is an expression or declaration
</br>

- Reducible expressions are also called 'redexes.'

```
1 + 1
```
is  a reducible expression.


<hr><hr>
## Functions
##### Expressions are the most basic unit of a Haskell program, and functions are a specific type of expression.
</br>

Functions in Haskell are related to functions in mathematics
- They map an input or set of inputs to an output. 
- A function is an expression that is applied to an argument and always returns a result.
- Haskell doesn’t evaluate everything to canonical or normal form by default. Instead, it only evaluates to weak head normal form (WHNF) by default.

```
(\f -> (1, 2 + f)) 2
```

reduces to the following in WHNF:

```
(1, 2 + 2)
```


<hr><hr>
## Arithmetic Functions
</br>

| Operator | Name | Purpose/Application |
|:--|:--|:--|
| + | plus | addition |
| - | minus | subtraction |
| * | asterisk | mutiplication |
| / | slash | fractional division |
| div| divide | integral division, round down |
| mod | modulo | like ‘rem’, but after modular division |
| quot | quotient | integral division, round towards zero |
| rem | remainer | remainder after division |


Modular arithmetic is a system of arithmetic for integers where numbers “wrap around” upon reaching a certain value, called the modulus. It is often explained in terms of a clock.


<hr><hr>
## Let and where
</br>

- `let` introduces an expression, so it can be used wherever you can have an expression.
- `where` is a declaration and is bound to a surrounding syntactic construct


Example using `where`:

```haskell
-- FunctionWithWhere.hs

module FunctionWithWhere where

printInc n = print plusTwo 
  where plusTwo = n + 2
```

Example using `let`:

```haskell
-- FunctionWithLet.hs

module FunctionWithLet where 

printInc2 n = let plusTwo = n + 2
              in print plusTwo
```