# Accessing Location Within @reach/router

The API of [`@reach/router`](https://reach.tech/router) departs a bit from
[`react-router`](https://reacttraining.com/react-router/) in a couple ways.
The `location` prop which you may be used to having access to automatically
is instead available through the
[`Location`](https://reach.tech/router/api/Location) component.

```javascript
import React from 'react';
import { Location } from '@reach/router';

const MyComponent = () => {
  return (
    <Location>
      {({ location }) => {
        return <p>Current Location: {location.pathname}</p>;
      }}
    </Location>
  );
}
```

This is a contrived example, but you can imagine how you'd use it to access
`state` or even create an HOC similar to `withRouter`.
