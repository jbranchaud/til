# Always Use Inline Functions With Assign

The [`assign`
action](https://xstate.js.org/docs/guides/context.html#assign-action) allows
you to update the context of the state machine.  There are a couple ways to use
`assign`, but you should prefer the inline function style.

Technically `assign` can be passed an object literal like so to set a static
value:

```javascript
{
  actions: {
    resetCount: assign({
      count: 0
    })
  }
}
```

However, this causes confusion for the TypeScript compiler and can create
surprising and unrelated type errors in the parts the code that use the
machine.

To keep the compiler happy, you should instead use inline functions. Either
like this:

```javascript
{
  actions: {
    resetCount: assign((_context) => {
      return {
        count: 0
      }
    })
  }
}
```

or like this:

```javascript
{
  actions: {
    resetCount: assign({
      count: (_context) => 0
    })
  }
}
```
