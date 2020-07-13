# Test Timing-Based Code With Jest Fake Timers

In real-world code we use timeouts to do things like debouncing and throttling
of functions. This is really hard to test efficently and accurately with basic
test runner tooling.

Jest, however, offers some [Timer Mock
tooling](https://jestjs.io/docs/en/timer-mocks) that removes most of the
complexity of getting this right.

Here is a method to test:

```javascript
const doSomethingAfter200ms = doSomething => {
  setTimeout(() => {
    doSomething();
  }, 200);
};
```

A test that shows this to work would have to observe `doSomething` getting
called after 200ms.

The following test won't work because the expectation is evaluated before the
timeout function is triggered.

```javascript
describe("doSomethingAfter200ms", () => {
  test("does something after 200ms (fail)", () => {
    const doSomething = jest.fn();

    doSomethingAfter200ms(doSomething);

    expect(doSomething).toHaveBeenCalled();
  });
});
```

By activating `jest.useFakeTimers()`, we can simulate the passing of 200ms and
then check that our mocked function was called.

```javascript
jest.useFakeTimers();

describe("doSomethingAfter200ms", () => {
  test("does something after 200ms (pass)", () => {
    const doSomething = jest.fn();

    doSomethingAfter200ms(doSomething);

    jest.advanceTimersByTime(201);

    expect(doSomething).toHaveBeenCalled();
  });
});
```

Jest's function mocks and timer mocks make this possible.
