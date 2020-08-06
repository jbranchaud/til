# Turn An HTMLCollection Into An Array

If you are using any of the built-in document query utilities, such as
[`getElementsByClassName()`](https://developer.mozilla.org/en-US/docs/Web/API/Document/getElementsByClassName):

```javascript
> document.getElementsByClassName("some-class")
HTMLCollection(5) [ ... ]
```

Then you are going to get an
[`HTMLCollection`](https://developer.mozilla.org/en-US/docs/Web/API/HTMLCollection)
in response. An instance of this cannot be iterated over, so you cannot call
things like `map` and `filter` against it.

To use Array collection methods, you are first going to need to turn the
`HTMLCollection` into an array. You can do this with
[`Array.from`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/from):

```javascript
> Array.from(document.getElementsByClassName("some-class"))
[ ... ]
```

[source](https://medium.com/@chuckdries/traversing-the-dom-with-filter-map-and-arrow-functions-1417d326d2bc)
