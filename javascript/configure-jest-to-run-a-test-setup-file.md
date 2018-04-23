# Configure Jest To Run A Test Setup File

Jest can be configured to run a setup file before each test. This is useful
for configuring your testing framework in a single place, rather than in
each test file.

This setup file can be specified in `package.json` (or `jest.config.js`).

```javascript
// package.json
{
  // ...
  "jest": {
    "setupTestFrameworkScriptFile": "<rootDir>src/setupTests.js"
  }
}
```

The
[`setupTestFrameworkScriptFile`](https://facebook.github.io/jest/docs/en/configuration.html#setuptestframeworkscriptfile-string)
points to a test setup file at the specified location rooted at `<rootDir>`
(the root of your project).

This kind of setup is helpful for something like
[Enzyme](https://github.com/airbnb/enzyme/blob/master/docs/guides/jest.md)
that needs to be configured with a specific adapter for use throughout your
tests.
