# Wrap The Root Of A Gatsby App In A Component

Each component that is defined in the `pages` directory of a
[Gatsby](https://www.gatsbyjs.org/) app will be generated into a separate
static page. Each of these pages is meant to stand on its own. Nevertheless,
there is still a behind-the-scenes root component above all of these pages.
There are cases where'd you like to wrap this root component with some other
component, such as a Redux `Provider`.

This can be done using the `wrapRootElement` hook from the Browser API in
the `gatsby-browser.js` file.

```javascript
// gatsby-browser.js
import React from 'react';
import { Provider } from 'react-redux';

import store from './src/store';

export const wrapRootElement = ({ element }) => {
  return (
    <Provider store={store}>{element}</Provider>
  );
}
```

Each page and each component in your Gatsby app will now be downstream from
a Redux provider meaning that they can connect to the Redux store as needed.
You can use this technique for any top-level component that need to be
wrapped around the entire app.

[source](https://www.gatsbyjs.org/docs/browser-apis/#wrapRootElement)
