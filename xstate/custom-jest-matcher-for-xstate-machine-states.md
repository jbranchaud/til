# Custom Jest Matcher For XState Machine States

Here is a custom matcher for asserting the current state of an XState machine
for Jest-based tests. I made some adaptations to it, but it was mostly
developed by [Nick
Nisi](https://discord.com/channels/795785288994652170/809564635614150686/897559009077362738).

```typescript
import {State} from 'xstate'

declare global {
  namespace jest {
    // eslint-disable-next-line @typescript-eslint/no-unused-vars
    interface Matchers<R> {
      toMatchState(state: string): CustomMatcherResult
    }
  }
}

expect.extend({
  toMatchState(state: State<unknown>, value: string) {
    return {
      pass: state.matches(value),
      message: () =>
        `Expected
  "${JSON.stringify(state.value)}"
state to match
  "${JSON.stringify(value)}"`,
    }
  },
})
```

To make this available to your tests, place it in your `setupTests.ts` (or
`.js`) file, assuming that is configured in your `jest.config.js`.

It can be used in your tests like so:

```javascript
test("it transitions to open and back to closed", async () => {
  const service = interpret(confirmationMachine);

  service.start();

  service.send({
    type: "OPEN_DIALOG",
    doubleConfirmText: "taco",
    action: jest.fn()
  });

  expect(service.state).toMatchState({ open: "idle" })

  service.send({ type: "CANCEL" });

  expect(service.state).toMatchState("closed")
});
```

Notice you can pass either a string or object representation of the state, if
there is nesting.

What is nice about this custom matcher is the informative failure messaging.
