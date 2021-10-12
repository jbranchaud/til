# Start A Machine In A Specific State

For testing (or debugging) purposes, it can be handy to get an XState machine
running from a specific state.

Let's say a machine has an initial state of `green` and the other states it can
be in are `yellow` and `red`. And `yellow` has sub-states of `walk` and
`hurry`.

By default, a machine will start in the specified initial state.

```javascript
const service = interpret(trafficLightMachine);

service.start();

service.state.value; //=> 'green'
```

We can tell the traffic light service to start in the `red` state instead.

```javascript
service.start('red');

service.state.value; //=> 'red'
```

We can even tell it to start in a sub-state (nested state) of a particular
state.

```javascript
service.start({ yellow: 'hurry' });

service.state.value; //=> { yellow: 'hurry' }
```

[source](https://xstate.js.org/docs/guides/interpretation.html#starting-and-stopping)
