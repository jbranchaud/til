# Destructuring The Rest Of An Array

ES6 offers some amount of pattern matching on arrays. This means you can do
fun stuff like grabbing a couple values and then destructuring the rest of
the array into a variable.

```javascript
> const kids = ["Mike", "Will", "Dustin", "Lucas", "Eleven", "Max"];
undefined
> const [first, second, ...rest] = kids;
undefined
> first
"Mike"
> second
"Will"
> rest
["Dustin", "Lucas", "Eleven", "Max"]
```

By using the `...` syntax with a variable name in the left-hand side of the
assignment, you are able to capture an array of whatever isn't assigned to
preceding variables.
