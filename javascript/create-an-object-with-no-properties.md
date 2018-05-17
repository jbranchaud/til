# Create An Object With No Properties

When you call `new Object` or even just instantiate an object with `{}`, you
are creating an object that uses the `Object` prototype. This means it
inherits from `Object.prototype`.

You can deliberately create an object with no properties by making sure that
it does not inherit `Object.prototype`.

```javascript
> const propertylessObject = Object.create(null);
{}

> propertylessObject.__proto__
undefined
```

Unlike most objects that we encounter as we write JavaScript, this object we
created with `Object.create(null)` has no properties including no
`__proto__`.

See
[Object.create](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/create)
and
[Object.prototype](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/prototype)
for more details.
