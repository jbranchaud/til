# Inactive And Active Component Styles With Radium

[Radium](https://github.com/FormidableLabs/radium) is "toolchain for React
component styling" allowing you to do comprehensive inline styling with CSS.

Often times, especially in the case of a series of nav elements, there is a
need to style one element as _active_ while styling the rest as _inactive_.
This can be achieved with Radium by defining two groups of styles (`base`
and `active`) and then relying on props to conditionally apply the active
style.

```javascript
import React from 'react';
import Radium from 'radium';

const styles = {
  base: {
    textDecoration: "none",
    color: "gray",
  },
  active: {
    color: "black",
    backgroundColor: "lightgray",
  },
};

let NavItem = ({ label, path, active }) => {
  return (
    <a
      href={path}
      style={[
        styles.base,
        styles[active && 'active'],
      ]}
    >{label}</a>
  );
};

NavItem = Radium(NavItem);
```

With Radium, our `base` (_inactive_) styles always get applied. Then, the
`active` styles only get applied when the `active` prop is true. We produce
a Radium-ified version of our `NavItem` on the last line so that Radium can
handle all of the styling of the component.
