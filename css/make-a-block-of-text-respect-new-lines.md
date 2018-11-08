# Make A Block Of Text Respect New Lines

Generally when we fill a `div` tag full of text, it will display it one long
strand irrespective of any line breaks that are included. This is a great
default, but not necessarily what we want when we are displaying text from
another source, such as our users.

We can convince a block of text to respect new lines by adding a couple CSS
properties.

```css
.multiline-text {
  word-wrap: break-word;
  white-space: pre-line;
}
```

The first rule, `word-wrap: break-word`, ensures that long lines of text
uninterrupted by new lines respect the boundaries of our wrapping element.
The second rule, `white-space: pre-line`, handles squashing of extra white
space and respecting of new lines.

See a [working example here](https://codepen.io/anon/pen/bQpKyv).
