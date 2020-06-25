# Check Classes On A DOM Element

You can use the [`classList`
property](https://developer.mozilla.org/en-US/docs/Web/API/Element/classList)
to check what classes have been assigned to a DOM element.

Assuming the following DOM element:

```html
<div id="auth-modal" class="modal hidden">...</div>
```

Once you get a handle on that element, using your preferred method (e.g.
[`Document.getElementById`](https://developer.mozilla.org/en-US/docs/Web/API/Document/getElementById)),
you can start inspecting the class list:

```javascript
> element.classList.contains("modal")
true

> element.classList.contains("hidden")
true

> element.classList.contains("taco")
false

> element.classList.toString()
"modal hidden"
```
