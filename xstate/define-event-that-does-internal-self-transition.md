# Define Event That Does Internal Self Transition

An XState `state` can contain a state transition in the `on` object that
represents a [_self
transition_](https://xstate.js.org/docs/guides/transitions.html#self-transitions).
A self transition means that the state points to itself. In response to that
event, it will transition directly to itself, instead of to another state node.

An
[_internal_](https://xstate.js.org/docs/guides/transitions.html#internal-transitions)
self transition is one in which the transition occurs, but it never _exits_ its
state node. That means `entry` and `exit` actions won't be triggered.

The parent state node can transition directly to itself or to a child node.
Here are a couple ways to define internal self transitions directly to the
parent node.

1. Implicit

```
states: {
  counting: {
    on: {
      INCREMENT: {
        actions: ['incrementCount'],
      },
    },
  },
},
```

No `target` is declared for `INCREMENT`, so an internal, self-transition is
implicit.

2. Explicit

```
states: {
  counting: {
    on: {
      INCREMENT: {
        internal: true,
        actions: ['incrementCount'],
      },
    },
  },
},
```

This says that the transition should be an `internal` one.

3. Undefined Target

```
states: {
  counting: {
    on: {
      INCREMENT: {
        target: undefined,
        actions: ['incrementCount'],
      },
    },
  },
},
```

An undefined target is an internal, self-transition.

[source](https://dev.to/jbranchaud/1-7-gui-tasks-with-react-and-xstate-counter-4l9i)
