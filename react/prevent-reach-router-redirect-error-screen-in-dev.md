# Prevent reach/router Redirect Error Screen In Dev

When using [@reach/router's
`<Redirect>`](https://reach.tech/router/api/Redirect) with tools like
create-react-app and Gatsby, you'll get those tools' development-mode error
screen overlays whenever a redirect happens. This has to do with how
@reach/router utilizes `componentDidCatch` to change the path without a
render. That error screen overlay can get annoying though. Prevent it with
the `noThrow` prop.

```javascript
return (
  <Redirect to={anotherPath} noThrow />
);
```
