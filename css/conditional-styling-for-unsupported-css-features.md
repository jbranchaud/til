# Conditional Styling For Unsupported CSS Features

As much as possible, you should aim to use CSS features that have broad browser
support. Sometimes browsers lag behind or you'd like to take advantage of a
draft feature in browsers that support it.

For these situations, you can provide conditional styling using the
[`@supports`
at-rule](https://developer.mozilla.org/en-US/docs/Web/CSS/@supports).

Here is an example of conditionally using `display: grid` if it is supported:

```css
@supports (display: grid) {
  div {
    display: grid;
  }
}
```

In [this
article](https://24ways.org/2019/zs-still-not-dead-baby-zs-still-not-dead/)
there is an example of using `background-blend-mode` and falling back to
`background-image` if it isn't supported.

```css
@supports not (background-blend-mode: normal) {
  body {
    background-image: url(fallback.png); 
  }
}
```
