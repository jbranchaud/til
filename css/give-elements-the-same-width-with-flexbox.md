# Give Elements The Same Width With Flexbox

By default, a row of elements in a basic flex container are going to have
dynamic widths that accommodate their contents. This may not be desirable if
you're going for a uniform look. You could give all child elements a fixed
width (e.g. `width: 100px`), but that loses out on the _flexibility_ of a
flexbox layout.

You can instead give all child elements a uniform and flexible width using the
`flex` property.

```css
.flex-container {
  display: flex;
}

.flex-child {
  flex: 1;
}
```

This value is a relative ratio. If all children of the flex container have the
same `flex` value (i.e. `1`), then they will all be equally sized and that size
will adjust as the width of the flex container changes.

[source](https://css-tricks.com/the-thought-process-behind-a-flexbox-layout/)
