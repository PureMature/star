# go_idiomatic

`go_idiomatic` provides a Starlark module that defines Go idiomatic functions and values.

## Functions

### `length(obj) int` {id="length-define"}

Returns the length of the object, for string it returns the number of Unicode code points, instead of bytes like `len()`.

#### Examples {id="length-example"}

**String**

Calculate the length of a CJK string.

```python
load("go_idiomatic", "length")
s = "你好"
print(length(s), len(s))
# Output: 2 6
```

**Misc**

Calculate the length of a list, set and map.

```python
load("go_idiomatic", "length")
print(length([1, 2, 3]), length(set([1, 2])), length({1: 2}))
# Output: 3 2 1
```

### `sum(iterable, start=0)` {id="sum-define"}

Returns the sum of `start` and the items of an iterable from left to right. The iterable's items and the `start` value are normally numbers.

#### Examples {id="sum-example"}

**Basic**

Calculate the sum of a list.

```python
load("go_idiomatic", "sum")
print(sum([1, 2, 3]))
# Output: 6
```

**Start**

Calculate the sum of a list with a start value.

```python
load("go_idiomatic", "sum")
print(sum([1, 2, 3], 10))
# Output: 16
```

### `distinct(iterable)` {id="distinct-define"}

Returns an iterable with distinct elements from the given iterable, i.e., without duplicates. For a list and custom types, it returns a new list with distinct elements. For a tuple, it returns a new tuple with distinct elements. For a dict, it returns the keys in a list. For a set, it just returns the original set.

#### Parameters {id="distinct-param"}

| name       | type       | description                                    |
|------------|------------|------------------------------------------------|
| `iterable` | `iterable` | The iterable to process for distinct elements. |

#### Examples {id="distinct-example"}

**List**

Get distinct elements from a list.

```python
load("go_idiomatic", "distinct")
print(distinct([1, 2, 2, 3, 3, 3]))
# Output: [1, 2, 3]
```

**Tuple**

Get distinct elements from a tuple.

```python
load("go_idiomatic", "distinct")
print(distinct((1, 2, 2, 3, 3, 3)))
# Output: (1, 2, 3)
```

**Dict**

Get distinct keys from a dictionary.

```python
load("go_idiomatic", "distinct")
print(distinct({1: 'a', 2: 'b', 3: 'c'}))
# Output: [1, 2, 3]
```

**Set**

Return original set (already distinct).

```python
load("go_idiomatic", "distinct")
print(distinct(set([1, 2, 3, 3])))
# Output: {1, 2, 3}
```

### `hex(x)` {id="hex-define"}

Convert an integer number to a lowercase hexadecimal string prefixed with `0x`.

#### Examples {id="hex-example"}

**Basic**

Convert an integer to a hexadecimal string.

```python
load("go_idiomatic", "hex")
print(hex(255))
# Output: 0xff
```

**Negative**

Convert a negative integer to a hexadecimal string.

```python
load("go_idiomatic", "hex")
print(hex(-42))
# Output: -0x2a
```

### `oct(x)` {id="oct-define"}

Convert an integer number to an octal string prefixed with `0o`.

#### Examples {id="oct-example"}

**Basic**

Convert an integer to an octal string.

```python
load("go_idiomatic", "oct")
print(oct(255))
# Output: 0o377
```

**Negative**

Convert a negative integer to an octal string.

```python
load("go_idiomatic", "oct")
print(oct(-56))
# Output: -0o70
```

### `bin(x)` {id="bin-define"}

Convert an integer number to a binary string prefixed with `0b`.

#### Examples {id="bin-example"}

**Basic**

Convert an integer to a binary string.

```python
load("go_idiomatic", "bin")
print(bin(255))
# Output: 0b11111111
```

**Negative**

Convert a negative integer to a binary string.

```python
load("go_idiomatic", "bin")
print(bin(-10))
# Output: -0b1010
```

### `bytes_hex(bytes,sep="",bytes_per_sep=1)` {id="bytes_hex-define"}

Return a string containing two hexadecimal digits for each byte in the instance.
If you want to make the hex string easier to read, you can specify a single character separator sep parameter to include in the output.
By default, this separator will be included between each byte.
A second optional bytes_per_sep parameter controls the spacing. Positive values calculate the separator position from the right, negative values from the left.

#### Parameters {id="bytes_hex-param"}

| name            | type     | description                        |
|-----------------|----------|------------------------------------|
| `bytes`         | `bytes`  | The bytes to convert.              |
| `sep`           | `string` | The separator to use.              |
| `bytes_per_sep` | `int`    | The number of bytes per separator. |

#### Examples {id="bytes_hex-example"}

**Basic**

Convert bytes to a hexadecimal string.

```python
load("go_idiomatic", "bytes_hex")
print(bytes_hex(b"hello"))
# Output: 68656c6c6f
```

**Separator**

Convert bytes to a hexadecimal string with a separator.

```python
load("go_idiomatic", "bytes_hex")
print(bytes_hex(b"hello", sep=":"))
# Output: 68:65:6c:6c:6f
```

**Bytes per separator**

Convert bytes to a hexadecimal string with a separator and bytes per separator.

```python
load("go_idiomatic", "bytes_hex")
print(bytes_hex(b"hello", sep=":", bytes_per_sep=2))
# Output: 68:656c:6c6f
```

### `sleep(secs)` {id="sleep-define"}

Sleeps for the given number of seconds.

#### Examples {id="sleep-example"}

**Basic**

Sleep for 1 second.

```python
load("go_idiomatic", "sleep")
sleep(1)
```

### `exit(code=0)` {id="exit-define"}

Exits the program with the given exit code.

#### Examples {id="exit-example"}

**Default**

Exit with default code (0).

```python
load("go_idiomatic", "exit")
exit()
```

**Non-zero**

Exit with code 1.

```python
load("go_idiomatic", "exit")
exit(1)
```

### `quit(code=0)` {id="quit-define"}

Alias for `exit()`.

#### Examples {id="quit-example"}

**Default**

Exit with default code (0).

```python
load("go_idiomatic", "quit")
quit()
```

**Non-zero**

Exit with code 1.

```python
load("go_idiomatic", "quit")
quit(1)
```

### `module(name, **kv)` {id="module-define"}

Returns the module with the given name and keyword arguments.
The main difference between the `module` and the `struct` is that the string representation of the `module` does not enumerate its fields.
The module can't be compared with `==` and `!=`, but the `struct` can.

#### Parameters {id="module-param"}

| name   | type       | description                            |
|--------|------------|----------------------------------------|
| `name` | `string`   | The name of the module to return.      |
| `kv`   | `**kwargs` | Key-value pairs to provide attributes. |

#### Examples {id="module-example"}

**Basic**

Get the `os` module with pid attribute.

```python
load("go_idiomatic", "module")
os = module("os", pid=1)
print(os)
# Output: <module "os">
```

### `struct(**kv)` {id="struct-define"}

Returns a new struct with the given keyword arguments.

#### Parameters {id="struct-param"}

| name | type       | description                            |
|------|------------|----------------------------------------|
| `kv` | `**kwargs` | Key-value pairs to provide attributes. |

#### Examples {id="struct-example"}

**Basic**

Create a struct with name and age attributes.

```python
load("go_idiomatic", "struct")
person = struct(name="Alice", age=30)
print(person)
# Output: struct(age = 30, name = "Alice")
```

### `make_struct(name, **kv)` {id="make_struct-define"}

Returns a new struct with the given name as constructor and keyword arguments.
Comparing two structs with `==` and `!=` will compare their constructors first and then their fields.

#### Parameters {id="make_struct-param"}

| name   | type       | description                            |
|--------|------------|----------------------------------------|
| `name` | `string`   | The name to use as constructor.        |
| `kv`   | `**kwargs` | Key-value pairs to provide attributes. |

#### Examples {id="make_struct-example"}

**Basic**

Create a struct with name and age attributes.

```python
load("go_idiomatic", "make_struct")
person = make_struct("Person", name="Alice", age=30)
print(person)
# Output: Person(age = 30, name = "Alice")
```

### `shared_dict()` {id="shared_dict-define"}

Creates a new instance of a thread-safe, mutable shared dictionary.
This allows for concurrent access and modification by multiple Starlark threads, ensuring data consistency and preventing race conditions.
The function initializes a SharedDict with default settings.

#### Examples {id="shared_dict-example"}

**Basic**

Create a new shared dictionary.

```python
load("go_idiomatic", "shared_dict")
sd = shared_dict()
print(sd)
# Output: shared_dict({})
```

### `make_shared_dict(name="", data=None)` {id="make_shared_dict-define"}

Creates a customized shared dictionary with an optional name and initial data.
The name parameter allows for more descriptive representations and debugging, while the data parameter lets you initialize the shared dictionary with pre-existing key-value pairs.

#### Parameters {id="make_shared_dict-param"}

| name   | type     | description                                                                                                                              |
|--------|----------|------------------------------------------------------------------------------------------------------------------------------------------|
| `name` | `string` | An optional name for the shared dictionary. Defaults to an empty string, which results in the default name "shared_dict".                |
| `data` | `dict`   | An optional Starlark dictionary to initialize the shared dictionary with. Defaults to None, which results in an empty shared dictionary. |

#### Examples {id="make_shared_dict-example"}

**Named Shared Dict**

Create a named shared dictionary without initial data.

```python
load("go_idiomatic", "make_shared_dict")
sd = make_shared_dict(name="my_dict")
print(sd)
# Output: my_dict({})
```

**Named Shared Dict with Data**

Create a named shared dictionary with initial data.

```python
load("go_idiomatic", "make_shared_dict")
initial_data = {"key1": "value1", "key2": "value2"}
sd = make_shared_dict(name="custom_dict", data=initial_data)
print(sd)
# Output: custom_dict({"key1": "value1", "key2": "value2"})
```

### `eprint(*args, sep=" ")` {id="eprint-define"}

Works like the standard `print()` function but prints the given arguments to `stderr` instead of `Print` handler defined in Go.
This is useful for logging errors or important warnings that should be separated from standard output.

#### Parameters {id="eprint-param"}

| name   | type     | description                                                             |
|--------|----------|-------------------------------------------------------------------------|
| `args` | `*args`  | The values to be printed.                                               |
| `sep`  | `string` | An optional separator between values. Defaults to a single space (" "). |

#### Examples {id="eprint-example"}

**Basic**

Print an error message to stderr.

```python
load("go_idiomatic", "eprint")
eprint("Error:", "An unexpected error occurred")
```

**Custom Separator**

Print multiple values to stderr with a custom separator.

```python
load("go_idiomatic", "eprint")
eprint("Path", "/home/user/docs", sep=" -> ")
# Output: Path -> /home/user/docs
```

### `pprint(*args, sep=" ")` {id="pprint-define"}

Works like the standard `print()` function but formats the given arguments in pretty JSON format with indentation.
If an argument cannot be converted to JSON, it falls back to converting the value to a string.
This is particularly useful for printing complex data structures in a human-readable format.

#### Parameters {id="pprint-param"}

| name   | type     | description                                                                                                    |
|--------|----------|----------------------------------------------------------------------------------------------------------------|
| `args` | `*args`  | The values to be printed. These can be any Starlark values, including lists, dictionaries, and custom structs. |
| `sep`  | `string` | An optional separator between values. Defaults to a single space (" ").                                        |

#### Examples {id="pprint-example"}

**Basic**

Pretty print a dictionary.

```python
load("go_idiomatic", "pprint")
pprint({"key": "value", "list": [1, 2, 3]})
# Output: {
#     "key": "value",
#     "list": [
#         1,
#         2,
#         3
#     ]
# }
```

**Multiple Values**

Pretty print multiple values with a custom separator.

```python
load("go_idiomatic", "pprint")
pprint({"key1": "value1"}, {"key2": "value2"}, sep="\n---\n")
# Output: {
#     "key1": "value1"
# }
# ---
# {
#     "key2": "value2"
# }
```

## Types

### `nil`

Value as an alias for `None`.

### `true`

Value as an alias for `True`.

### `false`

Value as an alias for `False`.

### `SharedDict`

A thread-safe, mutable dictionary that can be concurrently accessed and modified by multiple Starlark threads.
It ensures data consistency and prevents race conditions in concurrent environments.

**Methods**

#### `len()` {id="len-define"}

Returns the number of items in the shared dictionary.

##### Examples {id="len-example"}

**Basic**

Get the length of a shared dictionary.

```python
load("go_idiomatic", "make_shared_dict")
sd = make_shared_dict()
sd["key1"] = "value1"
print(sd.len())
# Output: 1
```

#### `perform(fn)` {id="perform-define"}

Calls the given function with the shared dictionary as its argument. The function must be callable.

##### Parameters {id="perform-param"}

| name | type       | description                                                                                                   |
|------|------------|---------------------------------------------------------------------------------------------------------------|
| `fn` | `callable` | The function to be called with the shared dictionary, and accepts the shared dictionary as its only argument. |

##### Examples {id="perform-example"}

**Basic**

Perform a custom operation on the shared dictionary.

```python
load("go_idiomatic", "make_shared_dict")
sd = make_shared_dict()
def my_operation(d): d["cnt"] = d.get("cnt", 0) + 1
sd.perform(my_operation)
print(sd)
# Output: shared_dict({"new_key": "new_value"})
```

#### `to_dict()` {id="to_dict-define"}

Returns a shadow-clone of the shared dictionary. Modifications to the clone do not affect the original shared dictionary.

##### Examples {id="to_dict-example"}

**Clone and Modify**

Clone a shared dictionary and add new data to the clone.

```python
load("go_idiomatic", "make_shared_dict")
sd = make_shared_dict()
sd_clone = sd.to_dict()
sd_clone["clone_key"] = "clone_value"
print(sd)
print(sd_clone)
# Output: shared_dict({})
#         {"clone_key": "clone_value"}
```

#### `to_json()` {id="to_json-define"}

Serializes the shared dictionary to a JSON string.

##### Examples {id="to_json-example"}

**Serialize**

Convert a shared dictionary to a JSON string.

```python
load("go_idiomatic", "make_shared_dict")
sd = make_shared_dict(data={"key": "value"})
json_str = sd.to_json()
print(json_str)
# Output: {"key": "value"}
```

#### `from_json(json_str)` {id="from_json-define"}

Deserializes a JSON string into the shared dictionary, updating it with the key-value pairs decoded from the string.

##### Parameters {id="from_json-param"}

| name       | type     | description                                                          |
|------------|----------|----------------------------------------------------------------------|
| `json_str` | `string` | The JSON string to deserialize and merge into the shared dictionary. |

##### Examples {id="from_json-example"}

**Deserialize**

Update a shared dictionary with data from a JSON string.

```python
load("go_idiomatic", "make_shared_dict")
sd = make_shared_dict()
sd.from_json('{"new_key": "new_value"}')
print(sd)
# Output: shared_dict({"new_key": "new_value"})
```
