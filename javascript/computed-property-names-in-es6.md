# Computed Property Names In ES6

Perhaps more often than not, property names in an object are based on
something dynamic rather than a static value. In ES5, you may end up with
code like the following to build an object with dynamic property names:

```javascript
var dynamic1 = 'hello',
  dynamic2 = 'world';
var obj = {};
var propName1 = dynamic1 + dynamic2;
var propName2 = 5 * 11;
obj[propName1] = true;
obj[propName2] = false;

> obj
// { 55: false, 'helloworld': true }
```

With ES6, we get _computed property names_ which allow us to do all of these
inline when defining the object. We just have to wrap the code that will be
evaluated to a property name in brackets:

```javascript
const dynamic1 = 'hello',
  dynamic2 = 'world';
const obj = {
  [dynamic1 + dynamic2]: true,
  [5 * 11]: false
};

> obj
// { 55: false, 'helloworld': true }
```

Computed properties are [already available in many modern
browsers](https://kangax.github.io/compat-table/es6/#test-object_literal_extensions_computed_properties).
