# Let Pointer Events Pass Through An Element

A graphical element can absorb a click event preventing your preferred target
from recieving it. And nothing will happen. If the element is purely for visual
effect, then there is some CSS you can add so that the underlying element will
receive the click event.

```css
.ignore-clicks {
  pointer-events: none;
}
```

The [`pointer-events`](https://developer.mozilla.org/en-US/docs/Web/CSS/pointer-events) property specifies if and how an element "can become the target of pointer events."

> In addition to indicating that the element is not the target of pointer
> events, the value none instructs the pointer event to go "through" the
> element and target whatever is "underneath" that element instead.

[source](https://bradfrost.com/blog/post/overcomplicatin/)
