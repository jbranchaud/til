# Filter Blur Requires Expensive Calculation

I had [a
page](https://www.visualmode.dev/connect-to-production-rails-console-aws-flightcontrol)
on my blog that was experiencing some odd rendering behavior. The issue was
manifesting a couple ways.

- Resizing and scrolling were janky and causing entire page layers to re-render
causing the page to flash in and out.
- Sometimes entire layer chunks would fail to paint leaving a white block
missing from the page.

The issue was occurring with and without JavaScript turned on for a
statically-built page. I suspected that some aspect of the CSS was at fault.

I was going back and forth with Dillon Hafer about what the issue could be and
he wondered, "could it be the backdrop-blur class from tailwind?". I tried
removing that class and the responsiveness of the page immediately improved.

The [`filter:
blur`](https://developer.mozilla.org/en-US/docs/Web/CSS/filter-function/blur)
and [`backdrop-filter:
blur`](https://developer.mozilla.org/en-US/docs/Web/CSS/backdrop-filter) both
use an expensive [Gaussian blur](https://en.wikipedia.org/wiki/Gaussian_blur)
calculation. One of these on a modern machine and browser probably won't have a
noticable impact. However, a bunch of them, as in the case of my page with a
recurring component, can have quite the performance hit.

[source](https://github.com/tailwindlabs/tailwindcss/issues/15256)
