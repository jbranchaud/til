# Alter The Display Name Of A Component

Components adopt their display name from the class or function that renders
them. A component's display name becomes important to know about as soon as
you start digging through the [React
devtools](https://github.com/facebook/react-devtools) interface -- whether
debugging or just perusing the component hierarchy, the display names of
components is what you'll see. In most circumstances, the display name is
good enough as is. If you want or need to, you can change it.

```javascript
const Hello = ({ name }) => {
  return (
    <h1>{name}</h1>
  );
};
Hello.displayName = "Hola";
```

By setting the `displayName` property on this component, you are able to
alter what name is used by React devtools.

This can be useful when bringing in a 3rd party library or
component that doesn't use a display name that you find helpful -- in
particular when using Higher Order Components.
