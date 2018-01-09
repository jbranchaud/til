# Rendering Multiple Nodes With Fragments

When rendering, React expects a component to only return a single node. The
DOM hierarchy of most components will easily follow this rule, but what
about those components that do have multiple inline nodes?

The two solutions have been to either wrap the inline nodes in an outer
`div` or to return them as a comma separated array of nodes. With React 16,
we can avoid the deficiencies of both of these approaches by using a
fragment.

Just wrap your inline nodes with a `React.Fragment` node. React will
understand your JSX without wrapping the output DOM in a superfluous `div`.

```javascript
render() {
  return (
    <React.Fragment>
      <p>Name: {firstName} {lastName}</p>
      <p>Email: {email}</p>
      <p>Age: {age}</p>
    </React.Fragment>
  );
}
```

See the [docs on fragments](https://reactjs.org/docs/fragments.html) for
more details.
