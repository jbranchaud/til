# Spread Merging Objects Includes Nil Values

A handy way to merge two objects together with ES6 JavaScript syntax is to use
the [spread
operator](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Spread_syntax).

```javascript
const combinedObj = { ...obj1, ...obj2 };
```

All the key-value pairs from each object are combined into a new object. For
any overlapping keys, the last occurrence's value will take precedence.

That bit about precedence is true for _nil_ values – `null` and `undefined` –
as well.

```javascript
const obj1 = { taco: 'bell', hello: 'world', list: [1,2,3] }
const obj2 = { burrito: 'house', hello: null, list: undefined }

const combinedObj = { ...obj1, ...obj2 }
//=> { taco: 'bell', hello: null, list: undefined, burrito: 'house' }
```

Notice that even though there are "actual" values for the `hello` and `list`
keys in `obj1`, they are overridden by the `null` and `undefined` values in
`obj2`.
