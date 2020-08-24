# Pretty Print Some DOM To Debug A Test

Our test's assertions can help guide what needs to change in the code.
Sometimes those test failures can be too opaque to be helpful.

It'd be easier if we could just take a peek at how the component is rendering.

```javascript
import { render, screen } from "@testing-library/react";
import { prettyDOM } from "@testing-library/dom";
import "@testing-library/jest-dom/extend-expect";

import MyComponent from "../MyComponent";

test("renders MyComponent", () => {
  const { container } = render(<MyComponent />);

  console.log(prettyDOM(container));

  const nameInput = screen.getByLabelText("Name");

  console.log(prettyDOM(nameInput));

  // some expectations
});
```

Passing the rendered container or elements that we've queried for to the
[`prettyDOM`](https://testing-library.com/docs/dom-testing-library/api-helpers#prettydom)
utility creates a formatted, syntax-highlighted version of that part of the
virtual DOM (without all the React Internal noise). This can then be logged out
for debugging purposes.
