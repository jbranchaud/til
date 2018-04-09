# Reach Into An Object For Nested Data With Get

Among the many [lodash](https://lodash.com/) utilities is
[`_.get`](https://lodash.com/docs/4.17.5#get) for getting data from nested
objects. You can specify where to reach into the nested data of an object
using a _path_.

Consider the following awkwardly nested object:

```javascript
const resp = {
  error: {
    errors: [
      { message: "Something went wrong" },
    ],
  },
};
```

Here is how we might reach into this with vanilla JavaScript:

```javascript
resp.error.errors[0].message;
```

Reaching into this for the `message` value is tricky because as soon as the
`resp` object contains differently nested data, an error is likely to be
thrown. We can simultaneously avoid a bunch of exception handling logic and
provide a default value with the `_.get` function:

```javascript
_.get(resp, 'error.errors[0].message', 'Default error message');
```

If we decide to not include a default value, then `undefined` will be used.
