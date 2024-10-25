# Make Truly Deep Clone With Structured Clone

There are a lot of ways to make a copy of an object. They are all hacks and
they all fail in certain circumstances. Using the spread trick only gives you a
shallow copy where references to nested objects and arrays can still be
updated. The `JSON.stringify` trick has to make things like dates into strings,
so it is lossy.

There is however now a dedicated method for deep copies with broad support
called
[`structuredClone`](https://developer.mozilla.org/en-US/docs/Web/API/Window/structuredClone).
It is available on `window`. Let's take a look at it and see how it comparse to
the spread operator trick.

```javascript
> // some data setup

> const data = { one: 1, two: 2, rest: [3,4,5] }

> const obj = { hello: 'world', taco: 'bell', data }

> const shallowObj = { ...obj }

> const deepObj = structuredClone(obj)

> // let's modify the original `data.rest` array

> data.rest.push(6)
4
> data
{ one: 1, two: 2, rest: [ 3, 4, 5, 6 ] }

> // now let's see who was impacted by that mutation

> obj
{
  hello: 'world',
  taco: 'bell',
  data: { one: 1, two: 2, rest: [ 3, 4, 5, 6 ] }
}

> shallowObj
{
  hello: 'world',
  taco: 'bell',
  data: { one: 1, two: 2, rest: [ 3, 4, 5, 6 ] }
}

> deepObj
{
  hello: 'world',
  taco: 'bell',
  data: { one: 1, two: 2, rest: [ 3, 4, 5 ] }
}
```

The `shallowObj` from the spread operator copy was mutated even though we
didn't intend for that. The `deepObj` from `structuredClone` was a true deep
copy and was unaffected.

[source](https://www.builder.io/blog/structured-clone)
