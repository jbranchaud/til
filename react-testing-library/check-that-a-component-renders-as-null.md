# Check That A Component Renders As Null

Consider a component that sometimes renders as `null`.

```javascript
const HiddenMessage = ({ message, hidden }) => {
  if (hidden) return null;

  return <span>{message}</span>;
};
```

How can we test the version of this component that renders as `null` when
`hidden` is `true`?

When
[react-testing-library](https://testing-library.com/docs/react-testing-library/intro)
renders a component, it wraps the whole thing in a surrounding `<div>`. Knowing
this, we can check if a component renders to `null` by checking the contents of
the wrapping `<div>` container.

```javascript
import React from "react";
import { render } from "@testing-library/react";
import "@testing-library/jest-dom/extend-expect";

test("renders as null", () => {
  const { container } = render(
    <HiddenMessage hidden message="You can't see me!" />
  );

  expect(container.firstChild).toBeNull();
});
```

The component renders as `null`, so the `firstChild` of the RTL `container`
will be `null`.
