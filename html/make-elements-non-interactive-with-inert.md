# Make Elements Non-Interactive With Inert

The [`inert`
attribute](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/inert)
global attribute is a boolean that can be applied to an element or section of
content in an HTML document. When it is `true`, that elements and anything
nested within it will not be interactive.

```html
<div class="fancy-animation" inert>
  <!-- ... -->
</div>
```

This has a couple different implications:

1. Click events are not fired on these elements.

2. These elements will not be able to gain focus.

3. These elements and content are hidden from assistive technology.

This is useful for a variety of things. In particular, it is good for
accessibility when a portion of the document, like a fancy animation, isn't
meant to be traversed by assistive technology.
