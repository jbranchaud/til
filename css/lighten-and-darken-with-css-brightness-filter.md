# Lighten And Darken With CSS Brightness Filter

CSS has a `filter` property that can be used with a variety of filter
functions. One of them is the `brightness()` filter. By feeding a percentage
less than `100%` to `brightness()`, the target element will be made darker.
Inversely, feeding a percentage greater than `100%` to `brightness()` will
make the element brighter.

```css
.brighter-span {
  filter: brightness(150%);
}

.darker-span {
  filter: brightness(50%);
}
```

<p data-height="171" data-theme-id="0" data-slug-hash="OjKJpa"
data-default-tab="result" data-user="jbranchaud" data-embed-version="2"
data-pen-title="OjKJpa" class="codepen">See the Pen <a
href="https://codepen.io/jbranchaud/pen/OjKJpa/">OjKJpa</a> by Josh
Branchaud (<a href="https://codepen.io/jbranchaud">@jbranchaud</a>) on <a
href="https://codepen.io">CodePen</a>.</p>
<script async
src="https://production-assets.codepen.io/assets/embed/ei.js"></script>

See this [CSS Tricks Article on the `filter`
property](https://css-tricks.com/almanac/properties/f/filter/) for more
details. Check out the browser support story
[here](http://caniuse.com/#feat=css-filters).
