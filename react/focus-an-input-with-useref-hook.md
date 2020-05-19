# Focus An Input With useRef Hook

You can send focus to an input by calling
[`focus()`](https://developer.mozilla.org/en-US/docs/Web/API/HTMLOrForeignElement/focus)
on it. To do this in a React context, you need to have a reference to the
underlying DOM node. You can get this reference with the [`useRef`
hook](https://reactjs.org/docs/hooks-reference.html#useref).

```jsx
import React, { useRef } from 'react';

const MyComponent = () => {
  const inputRef = useRef(null);

  const focusInput = () => {
    inputRef.current.focus();
  }

  return (
    <div>
      <input
        ref={inputRef}
        type="text"
        value=""
        {...otherProps}
      />
      <button onClick={focusInput}>Edit Input</button>
    </div>
  );
}
```

When this component mounts, the underlying `<input>` element will get tied to
`inputRef`. The `focusInput` handler that I've created can be used to send
focus to the corresponding `inputRef`. To demonstrate, I've passed it to the
`onClick` handler of the button. Clicking the button will focus the input.
