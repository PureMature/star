# Starlark

## Introduction

Starlark, previously known as Skylark, is a dialect of Python developed by Google for configuration tasks. Originating in the [Bazel build system](https://bazel.build/), it's now used across various projects. With its Python-like syntax, dynamic typing, and high-level data types, it offers an easy transition for Python developers. However, it stands out with its focus on simplicity, parallel execution, and determinism, making it ideal for embedding in larger applications. This language brings together the familiarity of Python and unique features tailored for configuration and scripting tasks.

## Highlights

- **Pythonic Syntax**: Offers an easy learning path for Python developers.
- **Simplicity**: Focuses on readability and maintainability.
- **Determinism**: Ensures reproducible builds and configurations.
- **Versatility**: While tailored for Bazel, it's adaptable to other projects.

## The Design Principles

Starlark operates on several key design principles that shape its utility and performance as an embedded configuration language:

- **Deterministic Evaluation**: Starlark exhibits deterministic behavior. This implies that executing the same code twice will invariably produce the same results, enhancing the predictability of code execution.
- **Hermetic Execution**: Starlark ensures hermetic execution. This means it does not permit access to the file system, network, or system clock, providing a secure environment for executing untrusted code.
- **Parallel Evaluation**: With Starlark, modules can be loaded concurrently. This is facilitated by making shared data immutable to guarantee thread-safe execution, making it suitable for parallel computing tasks.
- **Simplicity**: The language is consciously designed to be simple and easy to learn. It emphasizes readability, limiting the number of concepts needed for understanding the code, allowing users to quickly read and write code.
- **Focus on Tooling**: Starlark is tooling-focused. It's not just meant to be easily readable, analyzed, and modified by humans, but also to be efficiently handled by software tools. This focus enables its use in configuration and automation tasks.
- **Python-Like**: Starlark's syntax and semantics are similar to Python, a widely used language. This resemblance reduces the learning curve for new users, making the language semantics more intuitive.

## Key Features

Starlark is a versatile and powerful language with several key features:

- **Python-like Syntax**: Starlark's syntax and semantics closely resemble Python, offering ease of learning and use for Python developers. This familiarity is balanced with certain restrictions and variations tailored for its role as a configuration language.
- **Simplicity**: Emphasizing a minimalistic design, Starlark aims to be simple and safe, focusing on a limited set of concepts. This simplicity aids in making code easy to read, write, and understand, even for non-experts.
- **Embeddable**: Designed to be embedded within larger applications, Starlark allows host applications to define additional domain-specific functions and data types, extending the core language capabilities.
- **Deterministic Evaluation**: Starlark ensures that the same code will consistently produce the same results, regardless of the execution environment.
- **Hermetic Execution**: In its minimal runtime environment without external libraries, Starlark is designed to be safe for executing untrusted code. It's isolated from the filesystem, network, or system clock, ensuring secure execution.
- **Parallel Evaluation**: Starlark supports parallel module loading and execution, making it efficient for multi-core processors. Shared data becomes immutable, guaranteeing thread-safe execution.
- **High-level Data Types & First-class Functions**: Starlark supports high-level data types such as lists, dictionaries, and sets, and treats functions as first-class citizens. This allows functions to be passed as arguments, returned from other functions, and stored in data structures, providing flexibility in programming.
- **Garbage Collection**: With automatic garbage collection, Starlark simplifies memory management by automatically reclaiming memory allocated to objects that are no longer in use.

## Similarities to Python

Starlark shares numerous similarities with Python, which can be beneficial for developers familiar with Python:

- **Syntax**: The syntax of Starlark is highly reminiscent of Python, which means that Python programmers can easily transition to using Starlark. The structure of the code, the way expressions are formed, and the overall readability closely mirror Python's syntax.
- **Data Types**: Both languages support a variety of high-level data types. This includes primitive types like numbers and strings, as well as complex types like lists, tuples, and dictionaries. This commonality in data types allows for a smooth mapping of knowledge from Python to Starlark.
- **Control Flow**: Control flow structures such as `if`, `for`, and `while` loops are present in both languages. Starlark's control flow syntax and semantics are modeled after Python, though Starlark may impose some restrictions to fit its specific use cases.
- **Function Calls and Parameter Passing**: Function calling conventions in Starlark mirror those in Python, employing call-by-value parameter passing. This means that for immutable data types (e.g., `None`, `bool`, `int`, `float`, `str`), a copy of the value is passed, while for mutable types (e.g., `list`, `dict`), the reference is passed, allowing for modifications that reflect across all references to the object.

## Differences from Python

Starlark, while bearing a strong resemblance to Python, has several key differences.

Starlark, while syntactically similar to Python, introduces several key differences aimed at ensuring safety, predictability, and parallelizability in its execution environment. Below are the notable distinctions:

- **Control Flow Restriction**: Unlike Python, Starlark prohibits the use of `if` statements and `for` loops at the top level of a script. Such control flow constructs are only permissible within function definitions.

- **Deterministic Dictionary Iteration**: The iteration order of dictionaries in Starlark is guaranteed to be deterministic.

- **Different Module Loading Mechanism**: Starlark does not use the `import` statement like Python. Instead, it employs a `load` statement to load other files. The loaded modules become immutable.
- **Load Instead of Import**: Starlark uses a `load` statement instead of `import` to include code from other files. Loaded modules have their variables frozen and cannot be modified.
- **Module Loading**: The `import` statement, familiar in Python for module inclusion, is replaced by `load` in Starlark. The `load` statement specifically targets loading named symbols from other Starlark files, and the loaded modules are immutable.

- **Error Handling Simplification**: Starlark eschews Python's `try`/`except`/`finally` error handling mechanisms in favor of a `fail()` function that directly reports errors.
- **No Error Handling Mechanisms**: Starlark does not provide constructs like `try`...`except`...`finally` for error handling. Instead, it provides a `fail()` function to report errors.
- **No Exception Handling Mechanism**: Starlark lacks Python's `try`/`except`/`finally` mechanism for error handling. Errors are reported through a `fail` function.

- **Immutable Global Variables**: Global variables in Starlark are immutable after their initial definition. This constraint is designed to prevent side-effects that could complicate thread-safe execution and deterministic builds.
- **Immutable Global Variables**: Once a global variable is defined in Starlark, it cannot be modified, promoting thread safety and deterministic execution.
- **Immutable Global Variables**: Once defined, global variables in Starlark cannot be modified, promoting thread-safety and predictable behavior.

- **Lack of Object-oriented Features**: Starlark does not support classes and objects, diverging from Python's object-oriented programming capabilities.
- **No Classes or Objects**: Starlark does not support object-oriented programming features like classes and objects.
- **No Classes or Objects**: Starlark does not support object-oriented programming features such as classes and objects.

- **Limited Built-in Libraries**: Starlark's built-in functions and libraries vary from Python's, with many system-level libraries, such as file operations, unavailable and requiring external implementation.
- **Limited Standard Library**: Starlark's standard library is more limited compared to Python's, as it is designed to be embedded in applications with restricted capabilities.
- **Limited Standard Library**: Starlark's standard library is more restrained compared to Python's, particularly in areas involving system interaction or I/O operations.
- **Standard Library Differences**: The standard library in Starlark is much more limited compared to Python's. It omits features that require system-level access like file I/O operations, reflecting Starlark's design for embedding in larger applications without granting access to the underlying system.


- **Limited Recursion and Loops**: By default, recursion and infinite loops are unsupported in Starlark, but can be enabled using the `-recursion` flag.
- **Limited Recursion and Loops**: By default, Starlark does not support recursion or unbounded loops (e.g., `while` loops). These can be enabled by using specific flags during interpretation.
- **Recursion and Loop Limitations**: Starlark, by default, disallows recursion and infinite loops. Recursion can be enabled with a specific interpreter flag (`-recursion`), but this is not standard behavior.


- **Limited String Iteration**: Starlark does not support iteration over strings character by character.


- **No Top-Level Control Flow Statements**: In Starlark, `if` statements and `for` loops are not allowed at the top level of a file. They must be contained within functions.
- **No Top-Level Control Flow**: Starlark disallows `if` statements and `for` loops at the top level of a file, requiring them to be used within functions instead.

- **Restrictions on Operations between Boolean and Integer Types**: Operations between `bool` and `int` types are not allowed in Starlark, making expressions like `True < 2` and `True + True` invalid.

- **Singleton Tuples**: Single-element tuples in Starlark must have trailing commas, for example, `x = (1,)`.

- **Thread Safety and Parallel Execution**: Designed with concurrency in mind, Starlark ensures thread safety through immutable shared data and supports parallel evaluation of modules.
- **Thread-Safe Execution**: Starlark is designed for thread-safe execution, allowing its functions to run in parallel without data races due to its immutability guarantees.
- **Thread-Safety**: Independent Starlark threads can execute in parallel without data races due to the immutability of shared data.


These distinctions make Starlark well-suited for environments where safety, determinism, and parallel execution are critical, such as build systems and configuration languages.

## Further Reading and Resources
