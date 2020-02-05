# Support Nested Matching In Custom Jest Matchers

A [custom Jest matcher](define-a-custom-jest-matcher) can use standard
JavaScript operations to evaluate if the given value(s) should pass or not.

```javascript
expect.extend({
  toContainValue(receivedArray, containedValue) {
    const pass =
      receivedArray.some(value => value === containedValue);

    // return formatted pass/not-pass objects with messages
    return { ... }
  }
});
```

This approach alone doesn't support the power of Jest's nested matchers.
Consider trying to use this like so:

```javascript
expect(['a', 2, true]).toContainValue(expect.any(Number));
```

This would fail, even though there is a value in there that matches
`any(Number)`.

Jest ships with some [Jasmine](https://jasmine.github.io/) utilities that you
can use, just as Jest does internally, to perform nested matching:

```javascript
const { equals } = require("expect/build/jasmineUtils");

expect.extend({
  toContainValue(receivedArray, containedValue) {
    const pass =
      receivedArray.some(value => equals(value, containedValue));

    // return formatted pass/not-pass objects with messages
    return { ... }
  }
});
```

That `equals` utility knows how to compare raw values like integers, booleans,
and even whole objects against nested `expect` matchers.

[source](https://github.com/facebook/jest/issues/8295#issuecomment-482545274)
