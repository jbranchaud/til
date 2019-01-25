# Navigate With State Via @reach/router

With [@reach/router](https://reach.tech/router), you can programmatically
change your route using the
[`navigate`](https://reach.tech/router/api/navigate) function. This utilizes
the Context API, so its available anywhere nested under your router. To
provide some data to the destination location, include a `state` option in
the `navigate` call.

```javascript
const onSubmit = ({ data }) => {
  /* submit logic ... */

  navigate(nextPath, { state: { data }});
}
```

The component that renders in response to this navigation will have access
to this state.

```javascript
const NextComponent = ({ location }) => {
  const { data } = location.state;

  return (
    /* ... */
  )
}
```
