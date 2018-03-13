# Mapping Over One Or Many Children

In [Dynamically Add Props To A Child
Component](https://github.com/jbranchaud/til/blob/master/react/dynamically-add-props-to-a-child-component.md),
I talked about how a child element can be reconstituted with additional
props. The approach I showed will only work in the case of a single child
being nested in that component. What if you want your component to account
for one, many, or even children?

React comes with a built-in function for mapping that handles these cases.

```javascript
const ParentWithClick = ({ children }) => {
  return (
    <React.Fragment>
      {React.Children.map(children || null, (child, i) => {
        return <child.type {...child.props} key={i} onClick={handleClick} />;
      })}
    </React.Fragment>
  );
};
```

The [`React.Children.map`
function](https://reactjs.org/docs/react-api.html#reactchildrenmap) allows
mapping over one or many elements and if `children` is `null` or
`undefined`, it will return `null` or `undefined` respectively.

See a [live example here](https://codesandbox.io/s/kwj29y2j2r).
