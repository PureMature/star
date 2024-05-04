# log

`log` provides functionality for logging messages at various severity levels.

## Functions

### `debug(msg, *misc, **kv)`

Logs a message at the debug log level.

#### Parameters {id="debug-param"}

| name   | type       | description                                                                                   |
|--------|------------|-----------------------------------------------------------------------------------------------|
| `msg`  | `string`   | The message to log.                                                                           |
| `misc` | `*args`    | Additional message arguments will be concatenated to the message string separated by a space. |
| `kv`   | `**kwargs` | Key-value pairs to provide additional debug information.                                      |

#### Examples {id="debug-example"}

**basic**

Log a debug message with additional information.

```python
load("log", "debug")
debug("Fetching data at", "21:40", retry_attempt=1)
{"retry_attempt": 1}
```

### `info(msg, *misc, **kv)`

Logs a message at the info log level.

#### Parameters {id="info-param"}

| name   | type       | description                                                                                   |
|--------|------------|-----------------------------------------------------------------------------------------------|
| `msg`  | `string`   | The message to log.                                                                           |
| `misc` | `*args`    | Additional message arguments will be concatenated to the message string separated by a space. |
| `kv`   | `**kwargs` | Key-value pairs to provide additional information.                                            |

#### Examples {id="info-example"}

**basic**

Log an info message with additional information.

```python
load("log", "info")
info("Data fetched", response_time=42)
```

### `warn(msg, *misc, **kv)`

Logs a message at the warn log level.

#### Parameters {id="warn-param"}

| name   | type       | description                                                                                   |
|--------|------------|-----------------------------------------------------------------------------------------------|
| `msg`  | `string`   | The message to log.                                                                           |
| `misc` | `*args`    | Additional message arguments will be concatenated to the message string separated by a space. |
| `kv`   | `**kwargs` | Key-value pairs to provide additional warning information.                                    |

#### Examples {id="warn-example"}

**basic**

Log a warning message with additional information.

```python
load("log", "warn")
warn("Fetching data took longer than expected", response_time=123)
```

### `error(msg, *misc, **kv)`

Logs a message at the error log level and returns an error.

#### Parameters {id="error-param"}

| name   | type       | description                                                                                   |
|--------|------------|-----------------------------------------------------------------------------------------------|
| `msg`  | `string`   | The message to log.                                                                           |
| `misc` | `*args`    | Additional message arguments will be concatenated to the message string separated by a space. |
| `kv`   | `**kwargs` | Key-value pairs to provide additional error information.                                      |

#### Examples {id="error-example"}

**basic**

Log an error message with additional information.

```python
load("log", "error")
error("Failed to fetch data", response_time=240)
```

### `fatal(msg, *misc, **kv)`

Logs a message at the error log level, returns a `fail(msg)` to halt program execution.

#### Parameters {id="fatal-param"}

| name   | type       | description                                                                                   |
|--------|------------|-----------------------------------------------------------------------------------------------|
| `msg`  | `string`   | The message to log.                                                                           |
| `misc` | `*args`    | Additional message arguments will be concatenated to the message string separated by a space. |
| `kv`   | `**kwargs` | Key-value pairs to provide additional fatal error information.                                |

#### Examples {id="fatal-example"}

**basic**

Log a fatal error message with additional information.

```python
load("log", "fatal")
fatal("Failed to fetch data and cannot recover", retry_attempts=3, response_time=360)
```
