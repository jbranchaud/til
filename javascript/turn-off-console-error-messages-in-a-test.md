# Turn Off Console Error Messages In A Test

I'm using [Jest](https://facebook.github.io/jest/) to test a React component
that requires a prop via
[PropTypes](https://reactjs.org/docs/typechecking-with-proptypes.html). In
one of my tests, I want to test that component when the required prop is
excluded. The side effect of doing this is that my test output gets
cluttered with the PropType warning.

The thing to do is silence the error message during that test.

```javascript
it('renders a component without a required prop', () => {
  const originalError = console.error;
  console.error = jest.fn();

  // test code here
  expect(shallow(<My Component />)).toDoSomething;

  console.error = originalError;
});
```

We can silence `console.error` by temporarily replacing it with a
Jest-mocked function and then putting it back at the end of the test.
