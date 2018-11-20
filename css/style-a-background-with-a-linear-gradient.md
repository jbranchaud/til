# Style A Background With A Linear Gradient

The
[`linear-gradient`](https://developer.mozilla.org/en-US/docs/Web/CSS/linear-gradient)
function in its simplest form can be used to style the background of an
element with a vertical, linear gradient between two colors.

<p data-height="251" data-theme-id="0" data-slug-hash="pQpypW"
data-default-tab="result" data-user="jbranchaud" data-pen-title="pQpypW"
class="codepen">See the Pen <a
href="https://codepen.io/jbranchaud/pen/pQpypW/">pQpypW</a> by Josh
Branchaud (<a href="https://codepen.io/jbranchaud">@jbranchaud</a>) on <a
href="https://codepen.io">CodePen</a>.</p>
<script async src="https://static.codepen.io/assets/embed/ei.js"></script>

Here is what the CSS looks like:

```css
.container {
  background: linear-gradient(#00449e, #e66465);
}
```

The background of any element with the `container` class will be styled with
a linear gradient that transitions from `#00449e` to `#e66465`.
