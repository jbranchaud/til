# Read Only Input Elements

Here is an input element with a `value` and no `onChange` handler.

```javascript
const MyInput = ({ value }) => {
  return (
    <input value={value} />
  );
};
```

React will raise a warning regarding the `input` element because it has a
`value` without an `onChange` handler leaving React to wonder if it is
intended to be a _controlled_ or _uncontrolled_ component.

If our intention is to have the `value` set but not allow the user to
directly change it, we just need to let React know that.

```javascript
const MyInput = ({ value }) => {
  return (
    <input readOnly value={value} />
  );
};
```

The `readOnly` prop means we don't intend for the input to be modified by
user input. The React warning will now go away.

h/t Dillon Hafer
