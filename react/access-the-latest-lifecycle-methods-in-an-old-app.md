# Access The Latest Lifecycle Methods In An Old App

With [the release of React
16.3](https://reactjs.org/blog/2018/03/29/react-v-16-3.html) we have access
to some [new lifecycle
methods](https://reactjs.org/blog/2018/03/27/update-on-async-rendering.html)
and are in the first phase of what will eventually result in the deprecation
and removal of `componentWillMount`, `componentWillReceiveProps`, and
`componentWillUpdate`.

You may not be ready to move your project to React 16.3, but that doesn't
mean you can't start migrating your lifecycle methods now. We'll need a
polyfill --
[react-lifecycles-compat](https://github.com/reactjs/react-lifecycles-compat).

```javascript
import React from 'react';
import { pollyfill } from 'react-lifecycles-compat';

class MyComponent extends React.Component {
  static getDerivedStateFromProps(nextProps, prevState) {
    // ...
  }

  render() { ... }
}
polyfill(MyComponent)

export default MyComponent;
```

For any of our class components for which we'd like to start using the new
lifecycle methods, we just need to import the polyfill function and then
transform the class component with the polyfill before exporting it.

[source](https://reactjs.org/blog/2018/03/27/update-on-async-rendering.html#open-source-project-maintainers)
