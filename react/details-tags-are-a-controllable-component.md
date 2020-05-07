# Details Tags Are A Controllable Component

HTML has a lovely, but little-used tag for summarizing a set of collapsed
details. These details can be expanded and recollapsed by clicking the summary.
This is the `<details>` tag and it can be controlled with the `open` prop and
`onToggle` handler.

```jsx
import React, { useState } from "react";

export default function Details({ summary, children, onToggle }) {
  const [open, setOpen] = useState(false);

  return (
    <details
      open={open}
      onToggle={() => {
        setOpen(prev => !prev);
        onToggle();
      }}
    >
      <summary>{summary}</summary>
      {children}
    </details>
  );
}
```

[live
example](https://codesandbox.io/s/loving-merkle-hxlut?file=/src/App.js:0-545),
[source](https://github.com/facebook/react/issues/15486)
