# Wrapping A Component For Use In JavaScript

Consider the following
[ReasonReact](https://reasonml.github.io/reason-react/en) component for
displaying a greeting.

```reason
let component = ReasonReact.statelessComponent("Hello");

let make = (~name, _children) => {
  ...component,
  render: _self =>
    <p> {ReasonReact.string("Hello, ")} {ReasonReact.string(name)} </p>,
};
```

If we will just be using this component in a ReasonML context, then that is
all we need.

If we want this component available for use in a JavaScript file, we have a
little more work to do. We need to define the shape of the component's props
using a bucklescript directive and then wrap the component so that it gets
appropriate exported for a JavaScript context.

Here is what that looks like.

```reason
[@bs.deriving abstract]
type jsProps = {name: string};

let default =
  ReasonReact.wrapReasonForJs(~component, jsProps =>
    make(~name=jsProps->nameGet, [||])
  );
```

Our only prop is `name` which is a `string`. The `wrapReasonForJs` function
and accompanying binding to `default` mean that we can import the compiled
JS-equivalent like so:

```javascript
import Hello from 'src/components/Hello.bs.js';
```

See the [docs](https://reasonml.github.io/reason-react/docs/en/interop) for
more details on Reason/JS interop.
