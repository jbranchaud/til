# Mock A Function That A Component Imports

You have a component that relies on an imported function,
`isAuthenticated()`.

```javascript
// MyComponent.js
import React from 'react';
import { isAuthenticated } from './authentication';

const MyComponent = (props) => {
  if (isAuthenticated()) {
    return (<div>{/* ... */}</div>);
  } else {
    return (<div>Not authenticated</div>);
  }
};
```

You'd like to test that component without having to manage the
authentication of a user. One option is to mock out that function. This can
be done with some help from [`jest.fn()` and the `mock.mockReturnValue()`
function](https://github.com/jbranchaud/til/blob/master/javascript/mock-a-function-with-return-values-using-jest.md).

```javascript
// MyComponent.test.js
// ... various testing imports

import * as authModules from './authentication';

it('renders the component', () => {
  authModules.isAuthenticated = jest.fn().mockReturnValue(true);

  const wrapper = shallow(<MyComponent />);
  expect(toJson(wrapper)).toMatchSnapshot();
});
```

By importing the same module and functions used by `MyComponent`, we are
then able to replace them (specifically, `isAuthenticated`) with a mocked
version of the function that returns whatever value we'd like. As
`MyComponent` is being rendered, it will invoked our mocked version of
`isAuthenticated` instead of the actual one.

You could test the other direction like so:

```javascript
authModules.isAuthenticated = jest.fn().mockReturnValue(false);
```
