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

![brighter, regular, and darker spans](https://i.imgur.com/q4oy1d0.png)

See this [CSS Tricks Article on the `filter`
property](https://css-tricks.com/almanac/properties/f/filter/) for more
details. Check out the browser support story
[here](http://caniuse.com/#feat=css-filters).
