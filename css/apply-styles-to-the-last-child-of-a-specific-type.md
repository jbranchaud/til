# Apply Styles To The Last Child Of A Specific Type

The
[`:last-child`](https://developer.mozilla.org/en-US/docs/Web/CSS/:last-child)
pseudo-class is a way of specifying styling that will only be applied to an
element if it is the last child among its siblings. What if we have elements
that are declared amongst elements of another type? This can complicate that
styling.

The styling

```css
span:last-child {
  color: red;
}
```

won't take effect on our last `span` here

```html
<div>
  <span>One</span>
  <span>Two</span>
  <span>Three</span>
  <div>Something unrelated</div>
</div>
```

because amongst its siblings it isn't the last.

One way of getting around this is with the
[`:last-of-type`](https://developer.mozilla.org/en-US/docs/Web/CSS/:last-of-type)
pseudo-class.

```css
span:last-of-type {
  color: red;
}
```

See a [live example here](https://codepen.io/jbranchaud/pen/JLEyLP).
