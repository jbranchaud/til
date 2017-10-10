# Passing Props Down To React-Router Route

When using [react-router](https://github.com/ReactTraining/react-router),
you'll often use the `component` prop to have a certain component rendered.

```javascript
<Route
  path="/my/path"
  component={MyComponent}
/>
```

If, however, you need to pass props down into `MyComponent`, then you'll
want to use the `render` prop with an inline function.

```javascript
<Route
  path="/my/path"
  render={(routeProps) => (
    <MyComponent {...routeProps} {...props} />
  )}
/>
```

The two spread operator statements are essential. They will pass down the
[route
props](https://reacttraining.com/react-router/web/api/Route/Route-props)
that `Route` would have passed down plus the additional set of props that
you want to pass down.
