# Define HSL Colors With Alpha Values

HSL is a more intuitive option for defining colors in CSS.

It is an acronym which stands for Hue, Saturation, and Lightness which are the
three components of an HSL value. It is also possible to include a fourth
value: Alpha for the amount of transparency of the color.

The modern syntax allows you to use `hsl` with or without an alpha value, and
no need to use comma separators. If the alpha value is included, it must be
separated from the other three values with a forward slash.

```css
.modern-hsl {
  background-color: hsl(340deg 100% 50%);
}
.modern-hsla {
  background-color: hsl(340deg 100% 50% / 0.75);
}
```

If you need IE-support, then you'll have to use the older syntax. This version
of `hsl` requires comma separators, and to apply an alpha value you have to
switch to `hsla`.

```css
.old-hsl {
  background-color: hsl(340deg, 100%, 50%);
}
.old-hsla {
  background-color: hsla(340deg, 100%, 50%, 0.75);
}
```

You can see it in action and play around with the value in this [live
example](https://codepen.io/jbranchaud/pen/gOLVzjx?editors=1100).


See [Can I Use? on HSL](https://caniuse.com/?search=hsl) for more details on
browser support.

h/t to [Josh Comeau](https://twitter.com/JoshWComeau) and his excellent [CSS
for JS Developers course](https://css-for-js.dev/)
