# Determine Which Button Submitted The Form

It is pretty common for a form to have a singular submit button. If the user
clicks 'Submit', then the form fires a `POST` off to the server, the server can
process the request, and that's it.

But what about a form that has two or more buttons? For instance, imagine some
kind of consent form where the user needs to either _Accept_ or _Reject_ some
terms.

Just like other inputs, [the `<button>` tag can take both `name` and `value`
attributes](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/button#attr-name).

```html
<form action="/terms" method="post">
  <p>Something about the terms ...</p>
  <div>
    <label for="name">Email: </label>
    <input type="email" name="email" id="email" required>
  </div>
  <div>
    <button type="submit" name="commit" value="accept">Accept</button>
    <button type="submit" name="commit" value="reject">Reject</button>
  </div>
</form>
```

In addition to the `email` attribute, when the user submits the form, it will
include a `commit` attribute that has a value of either `'accept'` or
`'reject'`.

Naming it `commit` is [a convention I'm borrowing from Rails's form
helpers](https://guides.rubyonrails.org/v5.0/form_helpers.html#a-generic-search-form).
You can name it whatever makes sense to you.
