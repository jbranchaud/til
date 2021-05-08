# Use An XState Machine With React

There are a bunch of well-constructed XState machines available to directly
copy into your project from [XState Catalogue](https://xstate-catalogue.com/).
For instance, I can grab the [Confirmation Dialog
machine](https://xstate-catalogue.com/machines/confirmation-dialog) and paste
it into `confirmMachine.js`. Then I can grab
[`@xstate/react`](https://xstate.js.org/docs/packages/xstate-react/) which
comes with a `useMachine` hook.

```javascript
import * as React from "react";
import { useMachine } from "@xstate/react";
import confirmMachine from "./confirmMachine";
import Dialog from "./dialog";

export default function App() {
  const [current, send] = useMachine(confirmMachine);

  const deleteAction = () => { /* ... */ };

  const showDialog = current.value !== "closed";
  const open = () => {
    send({ type: "OPEN_DIALOG", action: deleteAction });
  };
  const close = () => {
    send("CANCEL");
  };
  const confirm = () => {
    send("CONFIRM");
  };

  return (
    <div className="App">
      <Dialog
        message="Are you sure you want to delete something?"
        handleConfirm={confirm}
        handleClose={close}
        showDialog={showDialog}
        errorMessage={current.context.errorMessage}
      />
      {/* other stuff */}
    </div>
  )
}
```

The `useMachine` call both interprets and starts up the machine service. The
`current` value is everything about the _current_ state of the machine. The
`send` is a function for dispatching transitions between machine states.
