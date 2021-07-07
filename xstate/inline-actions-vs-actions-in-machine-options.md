# Inline Actions vs Actions In Machine Options

When first spec'ing out a machine, I find it easiest to add my on-transition
actions directly inline.

```javascript
const countingMachine = createMachine({
  initial: "counting",
  context: { count: 0 },
  states: {
    counting: {
      on: {
        INCREMENT: {
          actions: assign({
            count: (context) => context.count + 1,
          }),
        },
      },
    },
  },
});
```

This is not what the XState docs recommend once you move beyond prototyping
your machine.

> It is not recommended to keep the machine config like this in production
> code, as this makes it difficult to debug, serialize, test, and accurately
> visualize actions.

When you're ready, you can refactor this by referencing the action by name and
then moving the action declaration to the `actions` object of the machine
options (second argument to `createMachine`).

```javascript
const countingMachine = createMachine({
  initial: "counting",
  context: { count: 0 },
  states: {
    counting: {
      on: {
        INCREMENT: {
          actions: 'incrementCount',
        },
      },
    },
  },
},
{
  actions: {
    incrementCount: assign({
      count: (context) => context.count + 1,
    }),
  },
});
```

When the machine interpreter sees `'incrementCount'`, it knows to look for an
action by that name in the machine options.

[source](https://xstate.js.org/docs/guides/actions.html)
