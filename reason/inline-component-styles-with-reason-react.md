# Inline Component Styles With Reason React

If you've written much React.js, the following may look familiar:

```javascript
<span style={{
  width: "10px",
  height: "10px",
  backgroundColor: "rgb(200, 64, 128)"
}} />
```

This is how we do inline styles with JSX in JavaScript.

When it comes to doing inline styles with JSX in our ReasonML code, the best
approach for now is to use a `make` function for styles provided by the
React DOM bindings.

```reason
<span style=(
  ReactDOMRe.Style.make(
    ~width="10px",
    ~height="10px",
    ~backgroundColor="rgb(200, 64, 128)",
    ())
)/>
```

[source](https://reasonml.github.io/reason-react/docs/en/style.html)
