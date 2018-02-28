# Use withRouter To Pass Down React-Router History

A standard way to navigate with
[react-router](https://github.com/ReactTraining/react-router) besides using
the `Link` component is to call `history.push`. Components that are directly
rendered by a `Route` will have access to this and other router props. But
what about other components?

The `withRouter` HOC gives us direct access to a `history` prop.

```javascript
import React from 'react';
import { withRouter } from 'react-router';

const SpecialButton = withRouter(({ history, path, text }) => {
  return (
    <Button
      onClick={() => { history.push(path); }}
    >
      {text}
    </Button>
  )
});
```

This special button component is given the `history` prop via the
`withRouter` HOC along with any props that we directly pass it. With that
we are able to directly invoke a route change using `history.push()`.
