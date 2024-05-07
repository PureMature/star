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



## Differences from Python


## Further Reading and Resources
