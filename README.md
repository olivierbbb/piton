## What is Piton

Piton is a counterfeit of the Python programming language, as well as a compiler for this language implemented in Racket. The syntax is similar except that type annotations are mandatory, Piton being statically and strongly typed. It does not implements any concepts such as inheritances or classes. For now, the compiler only supports MIPS assembly, but x86 may be added one day.

## Demo and Tests

TODO see `poetry_parser.py`

## Features

* The basics

Piton comes with scalar types *int* and *bool*, and not-so-scalar *string*. ints and bools are assigned by copy and strings by reference. The 3 of them are immutables. The *NoneType* also exists internally. (TODO check)
TODO if else while
TODO indentation
TODO comments

* Functions

Calling function is supported, and Piton's standard library includes typed *print* and *len* routines. Definining new functions is also possible, including nested functions. Functions names live in the same namespace as variables, which is a first step towards the past to "first-class citizenship". An internal *function* type does exists but cannot be used to declare variables nor function parameters, and function variables cannot be reassigned.

* String manipulation

Piton provides built-in string manipulation features in its standard library, such as subscript access, equality testing and concatenation.

* Scoping

Python's lexical scoping follows the *LEGB* rule: Local, Enclosed, Global, Built-in. In a Python file, symbols at the upper-most level are assigned to the global scope  (not considering the case of modules). In contrast, Piton does not really have a proper global scope, but all upper-most symbols are located in a implicit *main* function, which scopes acts a a kind of global scope enclosing all other scopes. Appart from this, Piton follow the same *LEGB* order for symbol resolution and supports variable and function shadowing. Functions body form a new block, conditional branches (if/else/while) do not.

* Safety

While Python is highly permissive and dynamic, Piton aims to be a safe static language. Its type system allows type checking and arity checking at compile-time. A few run-time dynamic checks are also performed, such as bounds checking for subscript access (only supported by strings for now), or zero division.

## Implementation details

### Inlining

To simplify compilation, all binary and unary operations are converted to internal function calls. In order to avoid the runtime overhead of numerous functions call, these internal functions (as well as the typed *print* functions) are then inlined by the compiler. What makes it possible is that during lexical analysis, all nested function calls are flattened, so as to avoid trouble with return values needing to be passed to the enclosing call. For instance, code such as this one:

    print(a + 2 * b)

while be transformed by the Piton compiler into:

    auto_8493 = 2 * b  
    auto_8494 = a + auto_8493  
    print(auto_8494)  

Inlining then becomes much easier as all returned values are already explicitely pushed on the stack. Note that to avoid issue with nested call inside conditional statements, a internal ast block structure is used to enclose the flattened statements.

### Indentation parsing

Python-style indentation parsing rests on the emission of *indent*/*dedents* tokens (see [Python 3 full grammar][1]). This requires the ability to emit several tokens from one parsing rule, in order to handle multiple dedents performed in one line such as in the following example:

    def greet(name: str):  
        if name == "William":  
            print_str("Hi Bill!")  
        else:  
            print_str("Hello " + name)  
    \# this line unidents 2 levels  
    greet("Sarah")

The Racket's yacc parser does not handle this situation out of the box. However, it is possible to wrap multiple tokens into one, and intercept all calls from the lexer to the parser so as to unwrap theses tokens and enqueue them, before dequeue one and returning it to the lexer.

[1]: https://docs.python.org/3/reference/grammar.html

### MIPS conventions

TODO

### Activation links

TODO

## What's missing

TODO
inheritance, lists, dynamic typing (*any*) => generics !
float
a real function type
non z terminated strings
dictonnaries: WONTDO
