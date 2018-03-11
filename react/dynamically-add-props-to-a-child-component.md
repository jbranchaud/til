# Dynamically Add Props To A Child Component

If your component has an element nested in it, then it will receive a
`children` prop. There are a number of things you can do beyond simply
including the `children` as part of the rendered output of the component.
One thing you can do is put additional props on the child.

```javascript
const ParentWithClick = ({ children }) => {
  return (
    <children.type
      {...children.props}
      onClick={() => alert("You clicked me!")}
    />
  );
};
```

This `ParentWithClick` component will reconstitute its child component with
its given props and a new `onClick` prop.

Here is how it can be used:

```javascript
const App = () => {
  return (
    <ParentWithClick>
      <span>Hello!</span>
    </ParentWithClick>
  );
};
```

Click on `Hello!` and you'll see the alert.

Minor caveat: multiple children and a string child will need to be handled
differently.

See a [live example here](https://codesandbox.io/s/n0pyn61yop).
