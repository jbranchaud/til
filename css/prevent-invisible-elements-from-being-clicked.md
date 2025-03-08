# Prevent Invisible Elements From Being Clicked

I have a nav element that when clicked reveals a custom drop-down menu. It
reveals it using CSS transitions and transformations (`opacity` and `scale`).
When the nav element is clicked again, the reverse of these transformations is
applied to "hide" the menu. This gives a nice visual effect.

It only makes the menu invisible and doesn't actually make it go away. That
means that menu could be invisible, but hovering over the top of a button on
the screen. The button cannot be clicked now because the menu is intercepting
that [_pointer
event_](https://developer.mozilla.org/en-US/docs/Web/CSS/pointer-events).

The fix is to apply CSS (or a class) when the drop-down menu is closed that
tells it to ignore _pointer events_.

```css
.pointer-events-none {
  pointer-events: none;
}
```

This is more of less what [the `pointer-events-none` TailwindCSS
utility](https://tailwindcss.com/docs/pointer-events) looks like.

This class is applied by default to the drop-down menu. Then when the nav item
is clicked, some JavaScript removes that class at the same moment that the menu
is visually appearing. When a menu item is selected or the menu otherwise
closed, it transitions away and the `pointer-events-none` class is reapplied.
