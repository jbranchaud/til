# Render An Array Of Elements With React 16

[React 16 was released
today](https://facebook.github.io/react/blog/2017/09/26/react-v16.0.html).
Among many exciting features and updates is support for rendering an array
of elements.

This can look as simple as this example:

```javascript
return [
  <li key="1">One</li>,
  <li key="2">Two</li>,
  <li key="3">Three</li>
];
```

It really shines in the case of generating elements from an array of data.

```javascript
let data = [
  { value: "One", key: "1" },
  { value: "Two", key: "2" },
  { value: "Three", key: "3" }
];
return data.map(item => {
  return (
    <li key={item.key}>
      {item.value}
    </li>
  );
});
```

No need to wrap the result in a `<div>`!

[source](https://facebook.github.io/react/docs/react-component.html#render)
