# Prevent Hidden Element From Flickering On Load

Here is what it might look like to use [Alpine.js](https://alpinejs.dev/) to
sprinkle in some JavaScript for controlling a dropdown menu.

```html
<div x-data="{ profileDropdownOpen: false }">
  <button
    type="button"
    @click="profileDropdownOpen = !profileDropdownOpen"
  >
    <!-- some inner html -->
  </button>
  <div x-show="profileDropdownOpen" role="menu">
    <a href="/profile" role="menuitem">Your Profile</a>
    <a href="/sign-out" role="menuitem">Sign Out</a>
  </div>
</div>
```

Functionally that will work. You can click the button to toggle the menu open
and closed.

What you might notice, however, when you refresh the page is that the menu
flickers open as the page first loads and then disappears. This is a quirk of
the element being rendered before Alpine.js is loaded and the
[`x-show`](https://alpinejs.dev/directives/show) directive has a chance to take
effect.

To get around this, we can _cloak_ any element with an `x-show` directive that
should be hidden by default.

```html
<div x-data="{ profileDropdownOpen: false }">
  <button
    type="button"
    @click="profileDropdownOpen = !profileDropdownOpen"
  >
    <!-- some inner html -->
  </button>
  <div x-cloak x-show="profileDropdownOpen" role="menu">
    <a href="/profile" role="menuitem">Your Profile</a>
    <a href="/sign-out" role="menuitem">Sign Out</a>
  </div>
</div>
```

This addition needs to be paired with some custom CSS to hide any _cloaked_
elements.

```css
[x-cloak] { display: none !important; }
```

[source](https://alpinejs.dev/directives/cloak)
