# Enforce Specific Values With PropTypes

Being able to constrain our user interfaces to very specific values is
valuable. This makes our interfaces easier to reason about and easier to
test. PropTypes in general are one of the ways that we constrain our UIs. We
can go even further than simple type constraints by limiting a prop to a
specific set of values, an enum if you will.

```javascript
MyComponent.propTypes = {
  flavor: PropTypes.oneOf(['Vanilla', 'Chocolate', 'Strawberry']),
};
```

The docs say about `oneOf()`:

> You can ensure that your prop is limited to specific values by treating it
> as an enum.

If we use `MyComponent` with a value such as `Pistachio`, we'll have a
console warning to answer for.

[source](https://reactjs.org/docs/typechecking-with-proptypes.html)
