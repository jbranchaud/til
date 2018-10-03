# CSS !important Is Not Supported By Inline Styles

You can get pretty far with React's inline styling of components. There are
however a few limitations. One such limitation is that the `!important`
clause is not supported.

If you try applying `!important` to an inline style like so:

```jsx
<div style={{ color: "red !important" }}>
  My div
</div>
```

You'll be disappointed when you open up the browser and inspect that `div`
tag. The `color` rule will be ignored and excluded from the output html.

[source](https://github.com/facebook/react/issues/1881)
