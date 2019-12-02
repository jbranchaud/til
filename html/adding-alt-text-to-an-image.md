# Adding Alt Text To An Image

Images on their own are not accessible to anyone using a screen reader. As the
people putting content on the web, we can make images more accessible by
providing _alternative_ text. This is such a standard that linters not only
flag `<img />` tags that are missing the `alt` attribute, they also admonish
you for unhelpful description text like "image."

You can appease the linter and make your content accessible with some
descriptive text:

```html
<img src="some/image.jpg" alt="a graph with lines trending up" />
```

When appropriate, you can also choose to include the `alt` attribute with a
blank value.

> If an image is purely decorative, then we add alt="" to let screen readers
> know that it’s not important. But if an image is informative, then we need to
> be supplying a text alternative that describes the picture for anyone who’s
> using a screen reader or isn’t able to see the image.

Part of accessibility is not putting a bunch of noise in front of your users.
If the image isn't part of the content, use `alt=""`.

[source](https://24ways.org/2019/twelve-days-of-front-end-testing/)
