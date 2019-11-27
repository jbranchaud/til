# Create A Pulsing Background With CSS Animation

You can create a smoothly pulsing background effect with CSS animations. This
can be achieved by defining a set of keyframes that start at one background
color, transitions to another color, and then transitions back to the original
color.

```css
@keyframes pulse {
  0%, 100% {
    background-color: #f56a3f;
  }
  50% {
    background-color: #9e42b0;
  }
}
```

At the beginning (`0%`) and end (`100%`) we declare the background color to be
`#f56a3f`. Halfway through (`50%`) it should be `#9e42b0`. The browser will
animate everything in between.

This can then be applied infinitely with a lengthy duration to give it a real
smooth feel.

```css
body {
  animation: pulse 20s infinite;
}
```

Here is a [live example](https://codepen.io/jbranchaud/pen/vYYqQjO).

[source](https://css-tricks.com/almanac/properties/a/animation/)
