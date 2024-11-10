# Add Line Numbers To A Code Block With Counter

The
[`counter`](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_counter_styles/Using_CSS_counters)
feature in CSS is a stateful feature that allows you to increment and display a
number based on elements' locations in the document. This feature is useful for
adding numbers to headings and lists, but it can also be used to add line
numbers to a code block.

We need to initialize the counter to start using it. This will give it a name
and default it to the value 0. We'll tie this to a `pre` tag which wraps our
lines of code.

```css {{ title: 'globals.css' }}
pre.shiki {
  counter-reset: line-number;
}
```

Then we need to increment the counter for every line of code that appears in
the code block

```css {{ title: 'globals.css' }}
pre.shiki .line {
  counter-increment: line-number;
}
```

Last, we need to display these incrementing `line-number` values _before_ each
line.

```css {{ title: 'globals.css }}
pre.shiki .line:not(:last-of-type)::before {
  content: counter(line-number);
  /*
   * plus any styling and spacing of the numbers
   */
}
```

This essentially attaches an element to the front (`::before`) of the line
whose content is the current value of `line-number`. It is applied to all but
the last `.line` because [shiki](https://shiki.matsu.io/) includes an empty
`.line` at the end.

Here is [the real-world example of
this](https://github.com/pingdotgg/uploadthing/blob/4954c9956c141a25a5405991c34cc5ce8d990085/docs/src/styles/tailwind.css#L13-L37)
that I referenced for this post.

Note: the counter can be incremented, decremented, or even explicitly set to a
specific value.
