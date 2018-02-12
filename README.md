## What it is

Piton is a counterfeit of the Python programming language, as well as a compiler for this language implemented in Racket. The syntax is similar except that type annotations are mandatory, Piton being statically and strongly typed. It does not implements any concepts such as inheritances or classes. For now, the compiler only supports MIPS assembly, but x86 may be added one day.

## Demo and Tests

## Features

* Types

Piton comes with scalar types *int* and *bool*, and not-so-scalar *string*. ints and bools are assigned by copied and strings by reference, the latest being immutables. The *NoneType* also exists internally. (TODO check)

* Functions

Calling function is supported, and Piton's standard library includes a couple. Definining new functions is also possible, including nested functions. Functions names live in the same namespace as variables, which is a first step towards the past to "first-class citizenship". An internal *function* type does exists but cannot be used to declare variables nor function parameters.

* Control

if else while

* Scoping

Python's lexical scoping follows the *LEGB* rule (Local, Enclosed, Global, Built-in). In a Python file, symbols at the upper-most level are assigned to the global scope  (not considering the case of modules). In contrast, Piton does not really have a proper global scope, but all upper-most symbols are located in a implicit *main* function, which scopes acts a a kind of global scope enclosing all other scopes. Appart from this, Piton follow the same *LEGB* order for symbol resolution and supports variable and function shadowing. Functions body form a new block, conditional branches (if/else/while) do not.

* Safety

While Python is highly permissive and dynamic, Piton aims to be a safe static language. Its type system allows him to perform checking and arity checking at compile-time. A few run-time dynamic checks are also performed, such as bounds checking for subscript access (only supported by strings for now), or zero division.

* String manipulation

Piton provides built-in string manipulation features in its standard library, such as subscript access, equality testing and concatenation.

## Implementation details

### Inlining

TODO

### Indentation parsing

TODO

### MIPS conventions

TODO

### Activation links

TODO

## The missing parts

TODO
inheritance, lists, dynamic typing (*any*) => generics !
float
a real function type
non z terminated strings
dictonnaries: WONTDO







