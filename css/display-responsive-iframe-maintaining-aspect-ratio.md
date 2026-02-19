# Display Responsive iframe Maintaining Aspect Ratio modern way

Generally when rendering an iframe, you'll specify the `width` and `height`
properties to give it a fixed display size.

You can make the iframe responsively expand to the full width of its parent
while maintaining its aspect ratio using a little CSS.

1. First, remove the `width` and `height` properties.
2. Second, add a wrapping iframe container:

```html
<div class="iframe-container">
  <iframe src="https://www.youtube.com/embed/7LDlUMMbv6k" ...></iframe>
</div>
```

3. Sprinkle on a little CSS to make it responsive:

```css
.iframe-container {
  width: 100%;
  aspect-ratio: 16 / 9;
}
```

Ben Marshall has a whole [guide to responsive
iframes](https://www.benmarshall.me/responsive-iframes/).
