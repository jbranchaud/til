# Conditionally Include Pairs In An Object

You can add key-value pairs to an object using the ES6 spread operator:

```javascript
> { one: 1, ...{ hello: "world" } }
{ one: 1, hello: "world" }
```

By combining the spread operator with some boolean logic, you can conditionally
add key-value pairs to an object:

```javascript
> {
    one: 1,
    ...(isArriving && { hello: "world" }),
  }
```

Depending on the value of `isArriving`:

```javascript
// isArriving === true
{ one: 1, hello: "world" }
```

or

```javascript
// isArriving === false
{ one: 1 }
```

This is useful for dynamically building up some configuration object or data
payload.
