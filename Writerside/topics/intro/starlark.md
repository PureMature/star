# Starlark

## Introduction

Starlark, previously known as Skylark, is a dialect of Python developed by Google for configuration tasks. Originating in the [Bazel build system](https://bazel.build/), it's now used across various projects. With its Python-like syntax, dynamic typing, and high-level data types, it offers an easy transition for Python developers. However, it stands out with its focus on simplicity, parallel execution, and determinism, making it ideal for embedding in larger applications. This language brings together the familiarity of Python and unique features tailored for configuration and scripting tasks.

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

These features collectively make Starlark a powerful, secure, and adaptable language for configuration and scripting within larger systems.

## Similarities to Python

Starlark shares numerous similarities with Python, which can be beneficial for developers familiar with Python:

- **Syntax**: The syntax of Starlark is highly reminiscent of Python, which means that Python programmers can easily transition to using Starlark. The structure of the code, the way expressions are formed, and the overall readability closely mirror Python's syntax.
- **Data Types**: Both languages support a variety of high-level data types. This includes primitive types like numbers and strings, as well as complex types like lists, tuples, and dictionaries. This commonality in data types allows for a smooth mapping of knowledge from Python to Starlark.
- **Control Flow**: Control flow structures such as `if`, `for`, and `while` loops are present in both languages. Starlark's control flow syntax and semantics are modeled after Python, though Starlark may impose some restrictions to fit its specific use cases.
- **Function Calls and Parameter Passing**: Function calling conventions in Starlark mirror those in Python, employing call-by-value parameter passing. This means that for immutable data types (e.g., `None`, `bool`, `int`, `float`, `str`), a copy of the value is passed, while for mutable types (e.g., `list`, `dict`), the reference is passed, allowing for modifications that reflect across all references to the object.

These resemblances contribute to making Starlark's learning curve more manageable for those proficient in Python.

## Differences from Python

Starlark, while bearing a strong resemblance to Python, has several key differences, and below are the notable distinctions:

- **Immutable Global Variables**: Once defined, global variables in Starlark cannot be modified, promoting thread-safety and predictable behavior.
- **Control Flow Restriction**: Unlike Python, Starlark prohibits the use of `if` statements and `for` loops at the top level of a script. Such control flow constructs are only permissible within function definitions.
- **Limited Recursion and Loops**: By default, Starlark does not support recursion or infinite or unbounded loops (e.g., `while` loops). Recursion can be enabled with a specific interpreter flag (`-recursion`), but this is not standard behavior.
- **Thread-Safe Execution**: Starlark is designed for thread-safe execution, allowing its functions to run in parallel without data races. This is achieved through a freezing mechanism that makes loaded modules and their variables immutable, preventing shared mutable state among threads.
- **Load Instead of Import**: Starlark uses a `load` statement instead of `import` to include code from other files. Loaded modules have their variables frozen and cannot be modified.
- **Error Handling Simplification**: Starlark eschews Python's `try`/`except`/`finally` error handling mechanisms in favor of a `fail()` function that directly reports errors.
- **No Classes or Objects**: Starlark does not support object-oriented programming features such as classes and objects.
- **Standard Library Differences**: The standard library in Starlark is much more limited compared to Python's. It omits features that require system-level access like file I/O operations, reflecting Starlark's design for embedding in larger applications without granting access to the underlying system.
- **Restrictions on Operations between Types**: Operations between `bool` and `int` types are not allowed in Starlark, making expressions like `True < 2` and `True + True` invalid.
- **Deterministic Dictionary Iteration**: The iteration order of dictionaries in Starlark is guaranteed to be deterministic.
- **Limited String Iteration**: Starlark does not support iteration over strings character by character.
- **Singleton Tuples**: Single-element tuples in Starlark must have trailing commas, for example, `x = (1,)`.

These distinctions make Starlark well-suited for environments where safety, determinism, and parallel execution are critical, such as build systems and configuration languages.

## Further Reading

For those interested in diving deeper into Starlark, here's a curated list of resources that should provide comprehensive insights and guidance:

- Official Documentation and Specifications
  - The **[Starlark Language Specification](https://github.com/bazelbuild/starlark/blob/master/spec.md)** offers a complete overview of the language's syntax, semantics, and features, making it an essential read for anyone looking to understand the core aspects of Starlark.
  - **[Starlark in Go Documentation](https://pkg.go.dev/go.starlark.net/starlark)** provides details on the Go implementation of Starlark, including its API and how to integrate Starlark into Go projects. This is particularly useful for developers working with Go.
  - **[Starlark Design Rationale](https://github.com/bazelbuild/starlark/blob/master/design.md)** delves into the decisions behind the language's design, offering insights into its simplicity, safety, and why certain features were included or omitted.
- Community and Development
  - For ongoing discussions, updates, and community support, the **[Starlark Mailing List](https://groups.google.com/g/starlark-go)** is a great place to ask questions, share experiences, and stay informed about developments in the Starlark ecosystem.
  - The **[Starlark Official Repository](https://github.com/bazelbuild/starlark)** and **[Starlark in Go project](https://github.com/google/starlark-go)** host the source code and are good resources for those interested in contributing to the project or understanding its internals.
- Usage and Applications
  - For a look at how Starlark is used in real-world projects and tools, **[Starlark Users and Tools](https://github.com/bazelbuild/starlark/blob/master/users.md)** provides a list of implementations and applications, showcasing the language's versatility.
  - **[Bazel's Use of Starlark](https://bazel.build/rules/language)** illustrates how Starlark is employed within Bazel, a powerful tool for building and testing software, further highlighting its utility in complex project configurations.
