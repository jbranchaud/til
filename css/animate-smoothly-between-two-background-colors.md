# Animate Smoothly Between Two Background Colors

CSS animations allow you to set up simple rules that the rendering engine
can then apply to create smooth transitions between style states.

To smoothly transition between two background colors, we can create a
keyframes at-rule with a fitting name (e.g. `pulse`).

```css
@keyframes pulse {
  0% {
    background-color: red;
  }
  50% {
    background-color: blue;
  }
  100% {
    background-color: red;
  }
}
```

Over the course of a single animation, this set of rules will start the
background color at red, transition to blue 50% of the way through, and then
back to red again.

We can then apply this animation within any of our CSS class definitions.

```css
.square1 {
  animation: pulse 2s infinite;
  width: 100px;
  height: 100px;
}
```

Anything with a class of `square1` will have a width and height of `100px`
as well as a pulsing background color.
