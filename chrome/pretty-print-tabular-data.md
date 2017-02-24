# Pretty Print Tabular Data

Looking at a bunch of data in the Chrome dev tools console isn't great. It
can be a bit difficult to read because of the way it is displayed.
Fortunately, the Chrome dev tools come with a handy way of displaying
tabular data, `console.table()`. If you give `console.table` an array of
objects or array of arrays, it will format it in a table like so:

![](http://i.imgur.com/LPgBpRB.png)

```js
console.table([{one: 1, two: 2, three: 3}])
```
