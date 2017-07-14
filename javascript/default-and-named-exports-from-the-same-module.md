# Default And Named Exports From The Same Module

ES6 module syntax allows for a single default export and any number of named
exports. In fact, you can have both named exports and a default export in
the same module.

Here is an example:

```javascript
// src/animals.js
export default function() {
  console.log('We are all animals!');
}

export function cat() {
  console.log('Meeeow!');
}

export function dog() {
  console.log('Rufff!');
}
```

In this case, you could import the default and named exports like so:

```javascript
// src/index.js
import animals, { cat, dog } from './animals.js';

animals(); // "We are all animals!"
cat();     // "Meeeow!"
dog();     // "Rufff!"
```

[source](http://2ality.com/2014/09/es6-modules-final.html)
