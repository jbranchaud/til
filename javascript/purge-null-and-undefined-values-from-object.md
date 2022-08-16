# Purge Null And Undefined Values From Object

The low-level utilities provided by [`lodash`](https://lodash.com/) offer a
couple ways to remove all the `null` and `undefined` values from an object.

First, here is an object that I want to _compact_ by removing all `nil` (`null`
and `undefined`) values.

```javascript
const data = {
  hello: 'world',
  list: [1,2,3],
  status: undefined,
  published_at: null,
  points: 0
}
```

One method of doing this is with the [`_.pickBy`
function](https://lodash.com/docs/4.17.15#pickBy).

```javascript
> _.pickBy(data)
//=> { hello: 'world', list: [1,2,3] }
```

Because it defaults to picking _truthy_ values, the `points: 0` is also going
to be stripped out.

Another method which allows us to more directly target just `null` and
`undefined` uses [`_.omitBy`](https://lodash.com/docs/4.17.15#omitBy) and
[`_.isNil`](https://lodash.com/docs/4.17.15#isNil).

```javascript
> _.omitBy(data, _.isNil)
//=> { hello: 'world', list: [1,2,3], points: 0 }
```

Notice this approach only removes the `null` and `undefined` key-value pairs.
The `points: 0` is left in.
