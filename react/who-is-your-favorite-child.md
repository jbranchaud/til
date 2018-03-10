# Who Is Your Favorite Child?

When we put some content inside the open and close tags of one of our
components, we get access to it as the `children` prop.

```javascript
const Parent = ({children}) => {
  return (
    <React.Fragment>
      <p>These are my favorites:</p>
      {children}
    </React.Fragment>
  );
}

const App = () => (
  <div>
    <Parent>
      Greg and Marsha
    </Parent>
  </div>
);
```

What happens if we also provide an explicit `children` prop to `Parent`?

```javascript
const App = () => (
  <div>
    <Parent children={"Jan and Peter"}>
      Greg and Marsha
    </Parent>
  </div>
);
```

Which will take precedence when we destructure `children` in the parent
component?

In the example above, we'll still see `Greg and Marsha` rendered. The
content placed inside the tags will take precedence over the explicit
`children` prop.

See a [live example here](https://codesandbox.io/s/kmo5lk2lr5).
