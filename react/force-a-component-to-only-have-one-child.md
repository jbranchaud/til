# Force A Component To Only Have One Child

A component can normally have an arbitrary number of elements nested
directly inside it. React's `Children.only` function can be used to force it
to a single direct child.

```javascript
import React, { Children, Component } from "react";

class App extends Component {
  render() {
    return (
      <SingleChildContainer>
        <span>There can only be one!</span>
      </SingleChildContainer>
    );
  }
}

const SingleChildContainer = props => {
  return Children.only(props.children);
};

export default App;
```

The React docs describe the behavior of `Children.only` as such,
_"Returns the only child in children. Throws otherwise."_.

If you modify the `return` in `App` to contain the following JSX

```javascript
<SingleChildContainer>
  <span>There can only be one!</span>
  <div>What about me?!</div>
</SingleChildContainer>
```

then an error will be thrown (`React.Children.only expected to receive a
single React element child`).

The [`Provider`
component](https://github.com/reactjs/react-redux/blob/master/src/components/Provider.js#L36)
in [`react-redux`](https://github.com/reactjs/react-redux) is an example of
where this is used.
