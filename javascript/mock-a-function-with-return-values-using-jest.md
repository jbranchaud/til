# Mock A Function With Return Values Using Jest

[Jest](https://facebook.github.io/jest/) provides a collection of utilities
for working with mocked functions.  To create a mock function, do:

```javascript
jest.fn()

// assign it to a variable
const fakeFunc = jest.fn();

// pass it as a prop
<SpecialInput handleChange={jest.fn()} />
```

A mocked function can then be attributed with a return value.

```javascript
const fakeFunc = jest.fn();
fakeFunc.mockReturnValue("hello");
fakeFunc(); // => "hello"
```

The
[`mockReturnValue()`](https://facebook.github.io/jest/docs/en/mock-function-api.html#mockfnmockreturnvaluevalue)
function ensures that the value is returned whenever your function is
called.

We can also limit the return value to occurring just once.

```javascript
const fakeFunc = jest.fn();
fakeFunc.mockReturnValueOnce("hello");
fakeFunc(); // => "hello"
fakeFunc(); // => null
```

[`mockReturnValueOnce()`](https://facebook.github.io/jest/docs/en/mock-function-api.html#mockfnmockreturnvalueoncevalue)
ensures the value is returned once and all subsequent calls yield `null`.
