# Events Stop Propagating Once Handled

In a hierarchical (or nested) XState machine, events are sent to the inner most sub-state of
the current state. If that state handles the event, then it won't propagate up
to parent states. If a state receives an event that it doesn't handle, that
event will propagate up to parent states until it is handled or there is
nothing to handle it.

Let's look at an example.

```javascript
{
  initial: "active",
  context: { count: 0 },
  states: {
    active: {
      on: {
        COUNT: {
          actions: "changeCount",
        },
      },
      initial: "increment",
      states: {
        increment: {
          on: {
            SWITCH_COUNT_DIRECTION: "decrement",
          },
        },
        decrement: {
          on: {
            SWITCH_COUNT_DIRECTION: "increment",
            COUNT: {
              actions: 'logEvent'
            },
          },
        },
      },
    },
  },
};
```

This machine starts in the `active.increment` state.

If I send the `COUNT` event, it will first go to the `active.increment` state.
It isn't handled there, so it will propagate up to `active` where it is
handled.

Now let's say I transition to `active.decrement`. If I send the `COUNT` event,
it will first go to `active.decrement` where it is handled. The `logEvent`
action happens and then the event stops. The `active` state does not receive
nor handle the `COUNT` event.

[source](https://twitter.com/jbrancha/status/1418269852398129152?s=20)
