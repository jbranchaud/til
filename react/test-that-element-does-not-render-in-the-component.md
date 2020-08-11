# Test That Element Does Not Render In The Component

With
[`react-testing-library`](https://testing-library.com/docs/react-testing-library/intro),
you can render a component and make assertions about the different parts of the
component that get rendered.

You can also make assertions that certain things _don't_ get rendered. To do that, first render the component:

```javascript
import { render, screen } from '@testing-library/react'
import '@testing-library/jest-dom/extend-expect'

import MyComponent from '../MyComponent'

test('renders component without Click Me button', () => {
  render(<MyComponent />)
})
```

Then add a `not` expectation with a `query*`-style matcher:

```javascript
  expect(screen.queryByText('Click Me')).not.toBeInTheDocument()
```

You'll get an immediate test failure if you try to directly select for the element using a `get*`-style matcher:


```javascript
  // ❌ will fail on `getByText` before the rest of the
  // assertion can be evaluated.
  expect(screen.getByText('Click Me')).not.toBeInTheDocument()
```

[source](https://kentcdodds.com/blog/common-mistakes-with-react-testing-library#using-query-variants-for-anything-except-checking-for-non-existence)
