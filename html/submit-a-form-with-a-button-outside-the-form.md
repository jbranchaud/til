# Submit A Form With A Button Outside The Form

You can tie a submit button to a form that the button doesn't live inside
of. The trick is to give the form an `id` and then reference that `id` with
the button's `form` property.

```html
<div>
  <form id="my-form">
    <label for="name">Name:</label>
    <input type="text" name="name"></input>
  </form>

  <!-- ... -->

  <button type="submit" form="my-form">Submit</button>
</div>
```

With this setup, clicking the _Submit_ button will cause the form to be
submitted.

See the [MDN Button
docs](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/button) for
more details.
