# Clean Up Repetition With :is() Pseudo-Class

You can use the [`:is()`](https://developer.mozilla.org/en-US/docs/Web/CSS/:is)
pseudo-class to match on a number of different selectors in a concise way. For
instance, here is how you can make some CSS shorter and more readable:

```css
/* before */
h1.text--bold, h2.text--bold, h3.text--bold, h4.text--bold, h5.text--bold {
  font-weight: 500;
}

/* after */
:is(h1, h2, h3, h4, h5).text--bold {
  font-weight: 500;
}
```

Here is how [CSS-tricks](https://css-tricks.com/almanac/selectors/i/is/)
describes it:

> :is() is the current name for the "Matches-Any" pseudo-class in the CSS4
working draft. The goal of the "Matches Any" selector (with all of it's names)
is to make complex groupings of selectors easier to write.

It still has limited browser support, so use it sparingly.
