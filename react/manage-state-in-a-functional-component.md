# Manage State In A Functional Component

Before the introduction of React 16.8, you had a couple options for declaring
and managing state in your components.

The first _class_ way was to create a class component and then [add local,
component state to
it](https://reactjs.org/docs/state-and-lifecycle.html#adding-local-state-to-a-class).

If you already had a functional component, you could avoid the conversion to a
class component with custom HOCs and Render Prop components or any number of
third-party libraries such as [React
PowerPlug](http://rena.to/react-powerplug/#/docs-components-state) and
[Recompose](https://github.com/acdlite/recompose).

However, projects using React 16.8+ have
[Hooks](https://reactjs.org/docs/hooks-intro.html) at their disposal. The Hooks
API's base offering is a state hook --
[`useState`](https://reactjs.org/docs/hooks-state.html).

```javascript
import React, { useState } from "react";

const Toggler = () => {
  const [on, setOn] = useState(false);
  const [toggleCount, setToggleCount] = useState(0);

  const incrementToggleCount = setToggleCount(prev => prev + 1);
  const handleToggle = () => {
    setOn(prev => !prev);
    incrementToggleCount();
  };

  return (
    <React.Fragment>
      <Thing on={on} />
      <button onClick={handleToggle}>{on ? "ON" : "OFF"}</button>
      <p>Toggle Count: {toggleCount}</p>
    </React.Fragment>
  );
}
```

You can manage a variety of state values in a functional component with
`useState`. The `useState` function takes the initial state value as an
argument and returns a tuple with the current state value and an _setter_
function for updating that piece of state.
