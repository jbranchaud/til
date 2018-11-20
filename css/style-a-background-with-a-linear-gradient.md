# Style A Background With A Linear Gradient

The
[`linear-gradient`](https://developer.mozilla.org/en-US/docs/Web/CSS/linear-gradient)
function in its simplest form can be used to style the background of an
element with a vertical, linear gradient between two colors.

![gradient example](https://i.imgur.com/Jybn4MB.png)
See the Pen <a href='https://codepen.io/jbranchaud/pen/pQpypW/'>pQpypW</a> by Josh Branchaud (<a href='https://codepen.io/jbranchaud'>@jbranchaud</a>) on <a href='https://codepen.io'>CodePen</a>.

Here is what the CSS looks like:

```css
.container {
  background: linear-gradient(#00449e, #e66465);
}
```

The background of any element with the `container` class will be styled with
a linear gradient that transitions from `#00449e` to `#e66465`.
