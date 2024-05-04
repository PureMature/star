# math

`math` defines a Starlark module of mathematical functions. All functions accept both int and float values as arguments. It's a official module provided in *Starlark in Go* repository.

## Functions

### `acos(x)` {id="acos-define"}

Return the arc cosine of x, in radians.

### `acosh(x)` {id="acosh-define"}

Return the inverse hyperbolic cosine of x.

### `asin(x)` {id="asin-define"}

Return the arc sine of x, in radians.

### `asinh(x)` {id="asinh-define"}

Return the inverse hyperbolic sine of x.

### `atan(x)` {id="atan-define"}

Return the arc tangent of x, in radians.

### `atan2(y, x)` {id="atan2-define"}

Return atan(y / x), in radians. The result is between -pi and pi. The vector in the plane from the origin to point (x, y) makes this angle with the positive X axis. The atan2() function can compute the correct quadrant for the angle since it knows the sign of both inputs. For example, atan(1) and atan2(1, 1) are both pi/4, but atan2(-1, -1) is -3*pi/4.

### `atanh(x)` {id="atanh-define"}

Return the inverse hyperbolic tangent of x.

### `ceil(x)` {id="ceil-define"}

Return the ceiling of x, the smallest integer greater than or equal to x.

### `copysign(x,y)` {id="copysign-define"}

Returns a value with the magnitude of x and the sign of y.

### `cos(x)` {id="cos-define"}

Return the cosine of x radians.

### `cosh(x)` {id="cosh-define"}

Return the hyperbolic cosine of x.

### `degrees(x)` {id="degrees-define"}

Convert angle x from radians to degrees.

### `exp(x)` {id="exp-define"}

Returns e raised to the power x, where e = 2.718281… is the base of natural logarithms.

### `fabs(x)` {id="fabs-define"}

Return the absolute value of x.

### `floor(x)` {id="floor-define"}

Return the floor of x, the largest integer less than or equal to x.

#### Examples {id="floor-example"}

**basic**

calculate the floor of 2.9

```python
load("math", "floor")
x = floor(2.9)
print(x)
# Output: 2
```

### `gamma(x)` {id="gamma-define"}

Returns the Gamma function of x.

### `hypot(x, y)` {id="hypot-define"}

Return the Euclidean norm, sqrt(x*x + y*y). This is the length of the
vector from the origin to point (x, y).

### `log(x, base)` {id="log-define"}

Returns the logarithm of x in the given base, or natural logarithm by
default.

### `mod(x, y)` {id="mod-define"}

Returns the floating-point remainder of x/y. The magnitude of the result is less than y and its sign agrees with that of x.

### `pow(x, y)` {id="pow-define"}

Returns x**y, the base-x exponential of y.

#### Examples {id="pow-example"}

**basic**

raise 4 to the power of 3

```python
load("math", "pow")
x = pow(4,5)
print(x)
# Output: 1024.0
```

### `radians(x)` {id="radians-define"}

Convert angle x from degrees to radians.

### `remainder(x, y)` {id="remainder-define"}

Returns the IEEE 754 floating-point remainder of x/y.

### `round(x)` {id="round-define"}

Returns the nearest integer, rounding half away from zero.

### `sqrt(x)` {id="sqrt-define"}

Return the square root of x.

### `sin(x)` {id="sin-define"}

Return the sine of x radians.

### `sinh(x)` {id="sinh-define"}

Return the hyperbolic sine of x.

### `tan(x)` {id="tan-define"}

Return the tangent of x radians.

### `tanh(x)` {id="tanh-define"}

Return the hyperbolic tangent of x.
