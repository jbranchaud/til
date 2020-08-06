# Disable Auto-Completion For A Form Input

The browser wants to be helpful by making informed suggestions about what
should be auto-filled into form inputs.

We may not want this behavior. It could be a source of data entry mistakes, an
annoyance, or just not something we want our users to experience.

We can turn this off at an individual field level with the `autocomplete`
attribute:

```html
<input type="email" id="email" name="email" autocomplete="off">
```

Note: It is `off` and not something like `false`.

[source](https://developer.mozilla.org/en-US/docs/Web/Security/Securing_your_site/Turning_off_form_autocompletion)
