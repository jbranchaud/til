# Inline Style Attributes Should Be Camel Cased

When adding a few quick styles to React components, you can add it directly
on the tags in the JSX. To do this, use the `style` tag with a plain old
JavaScript object of styles.

```javascript
<div style={{ padding: "1em", color: "#fff" }}>
```

If you are using a CSS attribute that is normally hyphenated like
`padding-top` or `background-color`, you'll need to camel case it in the
JSX.

```javascript
<div style={{ paddingTop: "1em", backgroundColor: "#fff" }}>
```

This is because our styles now need to conform to JavaScript syntax
rules since they are in the form of a POJO.

Read the [documentation](https://reactjs.org/docs/dom-elements.html#style)
for more details.
