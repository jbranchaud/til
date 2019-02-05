# :root Has Higher Specificity Than html

The `:root` CSS pseudo-selector and `html` will target the same element --
`<html>`, but `:root` has higher specificity. That means the property rules
declared under `:root` will take precedence over those under `html`.

```css
:root {
  background: red;
}

html {
  background: blue;
}
```

In the case of the above code, the `<html>` element's background color will
be `red`.

[source](https://developer.mozilla.org/en-US/docs/Web/CSS/:root)
