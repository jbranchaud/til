# Matching Multiple Values In A Switch Statement

Switch statements are a handy way to execute different branches of code
based on a value match. This is often what is used in Redux reducers when
updating the state in response to certain actions.

But what if you need multiple values to result in the same branch of
execution without duplicating the code?

The execution of a switch statement falls through, so after one match, it
will continue to try and do subsequent matches if you don't interrupt the
execution with a `break` or `return`. Conveniently, this solves our problem
of matching multiple values.

```javascript
switch (action.type) {
  case "UPDATE_NAME":
  case "UPDATE_DURATION":
    let newData = anotherReducer(state.data, action);
    return { ...state, data: newData };
  default:
    return state;
}
```

See the [MDN
docs](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/switch)
for more details.
