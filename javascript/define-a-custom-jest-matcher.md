# Define A Custom Jest Matcher

Though [Jest's built-in
matchers](https://jestjs.io/docs/en/expect) will get you pretty
far in most testing scenarios, you may find yourself in a testing situation
better served by a custom matcher. Custom matchers can be defined using the
[`expect.extend()`
function](https://jestjs.io/docs/en/expect#expectextendmatchers).

Here is an example of a matcher that can check equality of two objects based
solely on their `id` property.

```javascript
expect.extend({
  toHaveMatchingId(recieved, expected) {
    const pass = recieved.id === expected.id;

    if (pass) {
      return {
        pass: true,
        message: () =>
          `expected id:${expected.id} to not match actual id:${recieved.id}`
      };
    } else {
      return {
        pass: false,
        message: () =>
          `expected id:${expected.id} to match actual id:${recieved.id}`
      };
    }
  }
});
```

This defines the name of the matcher (`toHaveMatchingId`), contains some logic
to figure out whether `received` and `expected` pass the matcher, and then two
return conditions (`pass: true` and `pass: false`) with accompanying
message-returning functions.

It can then be used like any other Jest matcher:

```javascript
test("compare objects", () => {
  expect({ id: "001" }).toHaveMatchingId({ id: "001" });
  // ✅
  expect({ id: "001" }).toHaveMatchingId({ id: "002" });
  // ❌ expected id:002 to match actual id:001
});
```

Check out a [live example](https://codesandbox.io/s/focused-bush-vw2s5).
