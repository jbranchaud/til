# Apply Styles Based On Dark-Mode Preferences

There is a CSS media query for whether a user prefers a Dark-Mode or Light-Mode
color scheme. If you're site is able to provide styling for both modes, then
you can hook into those preferences like so:

```css
@media (prefers-color-scheme: dark) {
  /* dark-mode styles */
  /* perhaps changing some custom properties */
}

@media (prefers-color-scheme: light) {
  /* light-mode styles */
  /* perhaps changing some custom properties */
}
```

As of this writing,
[`prefers-color-scheme`](https://developer.mozilla.org/en-US/docs/Web/CSS/@media/prefers-color-scheme)
is still in a draft state, but it already has decent browser support.

[source](https://24ways.org/2019/interactivity-and-animation-with-variable-fonts/)
