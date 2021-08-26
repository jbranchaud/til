# Make Immediate And Delayed Transitions

An [XState](https://xstate.js.org/docs/) state can define an `on` key with an
object. The object can define one or more events that the state listens for and
transitions in response to. In addition to transitioning in response to an
event, you can have a state do both _immediate_ and _delayed_ transitions.

Here is an example state machine.

```javascript
export const loadingSpinner = createMachine(
  {
    initial: 'pending',
    context: {},
    states: {
      pending: {
        always: [
          { target: 'loading' }
        ]
      },
      loading: {
        after: {
          5000: { target: 'done' }
        }
      },
      done: {
        final: true
      }
    }
  }
);
```

This machine will start in the `pending` state. The `always` object will
immediately fire which will trigger a transition to the `loading` state. There
the `after` object will schedule a transition to the `done` state to happen in
5 seconds (5000ms).

The
[`always`](https://xstate.js.org/docs/guides/transitions.html#eventless-always-transitions)
is the immediate transition. The
[`after`](https://xstate.js.org/docs/guides/delays.html#delayed-transitions) is
the delayed transition.

The "eventless" `always` transition, in practice, is more useful when combined
with a condition. That allows you to define an immediate transition that only
takes place if some condition has already been met (e.g. does the `context`
already contain the thing we were about to look up?).
