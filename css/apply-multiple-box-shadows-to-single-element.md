# Apply Multiple Box Shadows To Single Element

Multiple box-shadows can be applied to the same DOM element. The `box-shadow`
property accepts a comma-separated list of `box-shadow` directives.

Here is a pretty nasty looking example from the [MDN
docs](https://developer.mozilla.org/en-US/docs/Web/CSS/box-shadow#Syntax):

```css
/* Any number of shadows, separated by commas */
box-shadow: 3px 3px red, -1em 0 0.4em olive;
```

Here is a more practical [example](https://codepen.io/jbranchaud/pen/GRReaxo):

```css
box-shadow: 0 0 0 2px #4caf50,
  0 3px 5px 0 rgba(0,0,0,0.5);
```

This gives the effect of a solid border with some shadow for depth.

Multiple shadows has [pretty robust browser
support](https://developer.mozilla.org/en-US/docs/Web/CSS/box-shadow#Browser_compatibility).

[source](https://stackoverflow.com/questions/8556604/is-there-a-way-to-use-two-css3-box-shadows-on-one-element/8556627)
