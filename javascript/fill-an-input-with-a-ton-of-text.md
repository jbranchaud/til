# Fill An Input With A Ton Of Text

I needed to test out a form validation for an input that should render an
error when the length of the context exceeds 10,000 characters. Two small
tricks make this easy.

First, you can target any DOM element via the Chrome dev tools by selecting
it and then referencing it via the `$0` magic variable. [More details
here](https://developers.google.com/web/updates/2015/05/the-currently-selected-dom-node).

```javascript
> $0
<input>...</input>
```

Second, you can quickly and precisely generate a very long string with the
`repeat` function.

```javascript
> "a".repeat(10000)
"aaaaaaaaaaaaaaaaaaaaaaa..."
```

Combine these two tricks in the browser to fill the input with a ton of
text:

```javascript
> $0.value = "a".repeat(10000)
```

h/t Dillon Hafer
