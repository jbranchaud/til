# Display Responsive iframe Maintaining Aspect Ratio

Generally when rendering an iframe, you'll specify the `width` and `height`
properties to give it a fixed display size.

You can make the iframe responsively expand to the full width of its parent
while maintaining its aspect ratio using a little CSS.

First, remove the `width` and `height` properties.

Second, add a wrapping iframe container:

```html
<div class="iframe-container">
  <iframe src="https://www.youtube.com/embed/7LDlUMMbv6k" ...></iframe>
</div>
```

Third, sprinkle on a little CSS to make it responsive:

```css
.iframe-container {
  position: relative;
  overflow: hidden;
  /* 16:9 aspect ratio */
  padding-top: 56.25%;
}

.iframe-container iframe {
  position: absolute;
  width: 100%;
  height: 100%;
  top: 0;
  left: 0;
  border: 0;
}
```

Ben Marshall has a whole [guide to responsive
iframes](https://www.benmarshall.me/responsive-iframes/).
