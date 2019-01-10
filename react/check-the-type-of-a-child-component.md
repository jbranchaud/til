# Check The Type Of A Child Component

There is a simple way to check the type of a child component.

```javascript
import React from 'react';

const Hello = () => <h1>Hello</h1>;

const Greeting = ({ children }) => {
  let hello;
  React.Children.forEach(children, child => {
    if(child.type === Hello) {
      hello = child;
    }
  });

  return hello;
};
```

This is a comparison of the child's type to the component constant we are
looking for.

This comparison is not the most robust. For instance, Gatsby does something
internally that throws off this comparison. Here is a more robust
comparison.

```javascript
if(child.type === Hello || child.type === <Hello />.type)
```

[source](https://github.com/gatsbyjs/gatsby/issues/3486)
