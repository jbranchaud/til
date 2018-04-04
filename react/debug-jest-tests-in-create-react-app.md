# Debug Jest Tests In create-react-app

When you put a `debugger;` statement in one of your Jest tests and
run `yarn test`, the test runner will ignore the debug statement and run to
completion. This is because Jest defaults to parallelizing tests which won't
mix well with manual debugging intervention.

If we want to be able to run our Jest tests through a debugger. We will need
two things. First, we need a debugging environment -- Chrome's devtools will
work well for this. Second, we need our tests to run in band. The
[`react-scripts`
documentation](https://github.com/facebook/create-react-app/blob/master/packages/react-scripts/template/README.md#debugging-tests)
recommends adding a second, debug-specific test command to your
`package.json`:

```javascript
"scripts": {
  "test:debug": "react-scripts --inspect-brk test --runInBand --env=jsdom"
}
```

You can now run `yarn test:debug` which will start a paused debug session.
Open chrome at `chrome://inspect` to access and open the debugging session
panel. Now, debug away.
