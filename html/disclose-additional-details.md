# Disclose Additional Details

You can add extra details to an HTML page that are only disclosed if the user
chooses to disclose them. To do that, we use the `<details>` tag. This tag
needs to have a `<summary>` tag nested within it. Anything else nested within
`<details>` will be what is disclosed when it is toggled open. The `<summary>`
is what is displayed when it is not open.

Here is a `<detail>` block I recently added to [Ruby Operator
Lookup](https://www.visualmode.dev/ruby-operators).

```html
<details className="pt-2 pb-6">
  <summary>What is this thing?</summary>
  <p className="pl-3 pt-2 text-gray-700 text-sm">
    Ruby is an expressive, versatile, and flexible dynamic programming language. That means there are all kinds of syntax features, operators, and symbols we can encounter that might look unfamiliar and are hard to look up. Ruby Operator Lookup is a directory of all these language features.
  </p>
  <p className="pl-3 pt-2 text-gray-700 text-sm">
    Use the search bar to narrow down the results. Then click on a button for the operator or symbol you want to explore further.
  </p>
</details>
```

On page load, the only thing we see is "What is this thing?" with a triangle
symbol next to it. If we click the summary, then the entire details block
(those two `<p>` tags) are disclosed.

[source](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/details)
