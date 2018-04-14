# Create Dynamically Named Custom React Components

A React element is as simple as a function that returns some valid JSX. Any
function will do.

```javascript
const CustomComponent = ({ children }) => {
  return (
    <React.Fragment>{children}</React.Fragment>
  );
};
```

This function provides us with a React component that has a fixed name --
`CustomComponent`. With the help of the [`displayName`
property](https://reactjs.org/docs/react-component.html#displayname), we can
create dynamically named components.

```javascript
const ComponentGenerator = ({ customName, children }) => {
  const CustomComponent = ({ children }) => {
    return (
      <React.Fragment>{children}</React.Fragment>
    );
  };
  CustomComponent.displayName = customName;

  return (
    <CustomComponent>{children}</CustomComponent>
  );
};

const App = () => {
  return (
    <ComponentGenerator customName="RandomComponentName">
      Hello!
    </ComponentGenerator>
  );
}
```

If we inspect the generated React tree, we will not see anything called
`<CustomComponent>`, but instead we will see our `<RandomComponentName>`
component.

Remember, React components need to have an uppercase name.
