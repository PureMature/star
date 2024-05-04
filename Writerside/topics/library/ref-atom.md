# atom

atom provides atomic operations for integers, floats, and strings.

## Functions

### `new_int(value=0) -> AtomicInt` {id="new_int-define"}

create a new AtomicInt with an optional initial value

#### Parameters {id="new_int-param"}

| name    | type  | description                  |
|---------|-------|------------------------------|
| `value` | `int` | initial value, defaults to 0 |

#### Examples {id="new_int-example"}

**basic**

create a new AtomicInt with default value

```python
load("atom", "new_int")
ai = new_int()
ai.inc()
print(ai.get())
# Output: 1
```

**with value**

create a new AtomicInt with a specific value

```python
load("atom", "new_int")
ai = new_int(42)
ai.add(42)
print(ai.get())
# Output: 84
```

### `new_float(value=0.0) -> AtomicFloat` {id="new_float-define"}

create a new AtomicFloat with an optional initial value

#### Parameters {id="new_float-param"}

| name    | type    | description                    |
|---------|---------|--------------------------------|
| `value` | `float` | initial value, defaults to 0.0 |

#### Examples {id="new_float-example"}

**basic**

create a new AtomicFloat with default value

```python
load("atom", "new_float")
af = new_float()
print(af.get())
# Output: 0.0
```

**with value**

create a new AtomicFloat with a specific value

```python
load("atom", "new_float")
af = new_float(3.14)
print(af.get())
# Output: 3.14
```

### `new_string(value="") -> AtomicString` {id="new_string-define"}

create a new AtomicString with an optional initial value

#### Parameters {id="new_string-param"}

| name    | type     | description                                |
|---------|----------|--------------------------------------------|
| `value` | `string` | initial value, defaults to an empty string |

#### Examples {id="new_string-example"}

**basic**

create a new AtomicString with default value

```python
load("atom", "new_string")
as = new_string()
print(as.get())  # Output: ""
```

**with value**

create a new AtomicString with a specific value

```python
load("atom", "new_string")
as = new_string("hello")
print(as.get())
# Output: "hello"
```

## Types

### `AtomicInt`

an atomic integer type with various atomic operations

**Methods**

#### `get() -> int` {id="get-define"}

returns the current value

#### `set(value: int)` {id="set-define"}

sets the value

#### `cas(old: int, new: int) -> bool` {id="cas-define"}

compares and swaps the value if it matches old

#### `add(delta: int) -> int` {id="add-define"}

adds delta to the value and returns the new value

#### `sub(delta: int) -> int` {id="sub-define"}

subtracts delta from the value and returns the new value

#### `inc() -> int` {id="inc-define"}

increments the value by 1 and returns the new value

#### `dec() -> int` {id="dec-define"}

decrements the value by 1 and returns the new value

### `AtomicFloat`

an atomic float type with various atomic operations

**Methods**

#### `get() -> float` {id="get-define"}

returns the current value

#### `set(value: float)` {id="set-define"}

sets the value

#### `cas(old: float, new: float) -> bool` {id="cas-define"}

compares and swaps the value if it matches old

#### `add(delta: float) -> float` {id="add-define"}

adds delta to the value and returns the new value

#### `sub(delta: float) -> float` {id="sub-define"}

subtracts delta from the value and returns the new value

### `AtomicString`

an atomic string type with various atomic operations

**Methods**

#### `get() -> string` {id="get-define"}

returns the current value

#### `set(value: string)` {id="set-define"}

sets the value

#### `cas(old: string, new: string) -> bool` {id="cas-define"}

compares and swaps the value if it matches old
