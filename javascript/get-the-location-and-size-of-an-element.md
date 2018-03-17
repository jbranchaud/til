# Get The Location And Size Of An Element

[All modern browsers](https://caniuse.com/#feat=getboundingclientrect) ship
with the [`getBoundingClientRrect()`
function](https://developer.mozilla.org/en-US/docs/Web/API/Element/getBoundingClientRect). It can be invoked for any DOM element. It returns the `x` and `y` coordinates of the element within the browser viewport as well as the `height` and `width` values and the `top` and `bottom` values along the `y-axis` and `left` and `right` values along the `x-axis`.

```javascript
> $0.getBoundingClientRect()
{
  "x": 381.421875,
  "y": 70,
  "width": 1030.578125,
  "height": 48,
  "top": 70,
  "right": 1412,
  "bottom": 118,
  "left": 381.421875
}
```

For instance, this is the result of invoking it against a header element on
the _MDN page_ linked above.
