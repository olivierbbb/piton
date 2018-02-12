## What is Piton

Piton is at the same time a language mimicking the syntax and semantics of Python and a compiler for this language, implemented in Racket. While type annotations are optional in Python, they are mandatory in Piton, which is statically and strongly typed. Piton does not implements any concepts such as inheritances or classes. For now, the compiler only supports MIPS assembly, but x86 may be added some day.

## Demo and Tests

TODO see `poetry_parser.py`

## Features

### The basics

Piton comes with scalar types *int* and *bool*, and not-so-scalar *string*. ints and bools are assigned by copy and strings by reference. All of them are immutables. The *NoneType* also exists internally, as well as a *function* type, but no *function* nor *NoneType* variable can be declared in the language. ints and bools come with basic arithmetic, comparison and logical operators as well as the unary *not* operator. strings can be tested for equality and concatenated with the *+* operator, and offer subscript access to individual characters.

Supported controls structures are limited to *if*-(*else*) and *while*. Indentation is handled in the same fashion as in Python, it can vary in length and mix tabs and spaces. Comments are also supported.

### Functions

Function calls are implemented, and Piton's standard library includes typed *print* and *len* routines. Definining new functions is also possible, including nested functions (declared in the body of an outer function). Functions names live in the same namespace as variables, which is a first step towards "first-class citizenship". As said before, an internal *function* type does exists but cannot be used to declare variables nor function parameters, and function variables cannot be reassigned. Recursivity is fully supported, without tail-call optimization just as in Python.

### Scoping

Python's lexical scoping follows the *LEGB* rule: Local, Enclosed, Global, Built-in. In a Python file, symbols at the upper-most level are assigned to the global scope  (not considering the case of modules). In contrast, Piton does not really have a proper global scope, but all upper-most symbols are located in a implicit *main* function, which scopes acts a a kind of global scope enclosing everything else except built-ins. Appart from this, Piton follow the same *LEGB* order for symbol resolution and supports variable and function shadowing. Function body open a new scope, conditional branches do not, as in Python.

### Safety

While Python is highly permissive and dynamic, Piton aims to be a safe static language. Its type system allows arity checking and type checking (including function parameters and return values) at compile-time. A few run-time dynamic checks are also performed, such as bounds checking for subscript access and zero division.

## Implementation details

### Inlining

To simplify compilation, all binary and unary operations are converted into internal function calls, as well as subscript accesses. In order to avoid the runtime overhead of numerous functions call, these internal functions (as well as the typed *print* functions) are inlined by the compiler. What makes it possible is that during the semantic analysis, all nested function calls are flattened so as to avoid trouble with return values needing to be passed to the enclosing call. For instance, code such as this one:

```python
print_int(a + 2 * b)
```

while be transformed by the Piton compiler into:

```python
auto_8493 = mul_ints(2, b)
auto_8494 = add_ints(a, auto_8493)
print(auto_8494)
```

Inlining becomes much easier as all returned values are already explicitely pushed on the stack. Note that to avoid issues with nested calls inside conditional statements, a internal ast block structure is used to enclose the flattened statements. Indeed, the additional "flat" statements cannot be inserted before the conditional statement, as they need to be reevaluated at every iteration of a while loop, for instance.

### Indentation parsing

Python-style indentation parsing rests on the emission of *indent*/*dedents* tokens (see [Python 3 full grammar][1]). This requires the ability to emit several tokens from one parsing rule, in order to handle multiple dedents performed in one line such as in the following example:

```python
def greet(name: str):
    if name == "William":
        print_str("Hi Bill!")
    else:
        print_str("Hello " + name)
# this line unidents 2 levels
greet("Sarah")
```

Racket's yacc parser does not handle this situation out of the box. However, it is possible to wrap multiple tokens into one, and intercept all calls from the lexer to the parser so as to unwrap theses tokens and enqueue them, before dequeue one and returning it to the lexer.

[1]: https://docs.python.org/3/reference/grammar.html

### MIPS conventions

MIPS register *$t9* is dedicated to storing the results of conditional expressions, as well as operations needed a temporary register immediately released, such as memory-to-memory moves. Registers *$t8* and *$t9* are used for the retrieval of enclosing scope variables (see following paragraph). Register *$t4*, *$t5* and *$t6* are available when we need to load memory values in registers to pass them to an instruction expecting register operands, or reciprocally when the result of a instruction has to be put in a register before being stored in memory.

Functions arguments are passed by pushing them on the stack before calling the function. Registers *$a0* to *$a3* are only used to pass arguments to inlined functions. On the other hand, the *$v0* register is always used to pass back return values. The *$sp* register is actually used a a frame pointer and is never modified within a function, the compiler being in charge of tracking the size of the stack.

### Activation links

Free variables are resolved at runtime using activation links, as described on [this page][2]. The tricky part to understand is that while it is possible to know at compile-timew to which scope belongs a variable refered by a non-local symbol, we do not know yet where it will lay in memory relatively to the current frame, as this depends on the execution flow :

```python
name: str = input()
def greet(greeting: str):
    print_str(greeting + " " + name)
def greet_warmly():
    say_hi("Hello dear" + name)
if be_warm:
    greet()
else:
    say_hi("Hello")
```

In this example, the symbol *name* inside *greet* always refer to the same variable belonging to the immediate outer scope of *greet*. But depending on where *greet* is called, the frame of this scope might be the previous one on the stack, or the one before.

Activation links build a chain allowing us to walk back up to the address of frame where the non-local variable is stored. At each function call, in addition to the return address and the arguments, the current frame pointer is pushed onto the stack. When accessing a non-local variable, the compiler knows how many times it has to walk up the activation link chain, because it knows the level of the relevant scope relatively to the current scope. Once the address the scope's frame is known, all that is left to do is to use the address of the variable relative to that frame.

[2]: http://pages.cs.wisc.edu/~fischer/cs536.s06/course.hold/html/NOTES/8.RUNTIME-VAR-ACCESS.html#accessLink

## What's missing

TODO
inheritance, lists, dynamic typing (*any*) => generics !
float
a real function type
non z terminated strings
dictonnaries: WONTDO
