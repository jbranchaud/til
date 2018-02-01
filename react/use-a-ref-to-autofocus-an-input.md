# Use A Ref To Autofocus An Input

When creating highly interactive interfaces with React, we are trying to
make the user's experience of our app as smooth as possible. This means that
when an edit button reveals an input field, we want that field to be in
focus so that the user can immediately start typing.

This is a great use for React's `ref` prop. When you supply your component
with a function as the `ref` prop, that function will be called with a
reference to itself on mount and with `null` on unmount.

```javascript
class MyAutofocusInput extends React.Component {
  focusInput = (component) => {
    if (component) {
      component.focus();
    }
  };

  render() {
    return (
      <input
        ref={this.focusInput}
        value={this.props.value}
        onChange={this.props.onChange}
      />
    );
  }
}
```

When this component gets rendered, the input will be focused via our
`focusInput` function.

Note: refs only work with class components, so don't try to use it with a
functional component.

See [Refs and the DOM](https://reactjs.org/docs/refs-and-the-dom.html) in
React's documentation for more details.
