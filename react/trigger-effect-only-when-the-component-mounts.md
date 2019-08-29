# Trigger Effect Only When The Component Mounts

With `useEffect`, you generally want to values used in the function to also be
included in the _dependency list_. This ensures the effect is triggered
whenever any of those values change.

But what if you only want the effect to be triggered when the component first
mounts?

This can be done by including an _empty_ dependency list.

```javascript
import React, { useState, useEffect } from "react";

function App() {
  const [count, setCount] = useState(0);
  const incrementCount = () => {
    setCount(prevCount => prevCount + 1);
  };

  useEffect(() => {
    console.log("The count is:", count);
  }, []);

  return (
    <div>
      <button onClick={incrementCount}>+</button>
      <p>Count: {count}</p>
    </div>
  );
}
```

In this example, we will see `The count is: 0` get logged when the component
first mounts. As we hit the button to increment the count, nothing else will be
logged.

See the [live example](https://codesandbox.io/s/mystifying-currying-l2rw2).
