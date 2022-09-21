# Tell Jest To Focus On Running Only One Test

Test output can be noisy. Sometimes one test is inadvertently dependent on
another. These are some of the reasons you may want to tell
[Jest](https://jestjs.io/) to focus in and only run one particular `test`
block.

You can do this by calling
[`test.only()`](https://jestjs.io/docs/setup-teardown#general-advice) instead
of `test()`.

Find the test block you are interested in focusing on and update it to look
like this:

```javascript
// tests above ...

test.only('ensure the function returns the value', () => {
  // ...
  // test implementation
  // ...
})

// tests below ...
```

With that 5-character addition (`.only`) we instruct Jest to run that one test
while skipping all others.

This is particularly useful when you are doing some `console.log` debugging of
a test. You can eliminate any confusion about which test is logging out by only
running one test.

[source](https://stackoverflow.com/a/42828586/535590)
