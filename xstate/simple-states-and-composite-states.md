# Simple States And Composite States

XState allows you to build [hierarchical state
machines](https://xstate.js.org/docs/guides/hierarchical.html). A hierarchical
state machine is one where there are substates nested under states.

States with nothing nested under them are _simple states_. States that have
substates are _composite states_.

```javascript
const machine = createMachine({
  // Starting State
  initial: "active",
  // Starting Context
  context: { count: 0 },
  // States
  states: {
    inactive: {
      always: { target: "active" },
    },
    active: {
      on: {
        SWITCH_COUNT_DIRECTION: {
          actions: ["logSwitch", "consoleLogSwitch"],
        },
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
          },
        },
      },
    },
  },
});
```

- The `inactive` state is a _simple state_. There is nothing nested under it.
- The `active` state is a _composite state_. There are two substates
  (`increment` and `decrement`) nested under it.
- The `increment` and `decrement` states are both _simple states_. Nothing is
  nested under them.
