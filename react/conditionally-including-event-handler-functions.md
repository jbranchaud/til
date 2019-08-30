# Conditionally Including Event Handler Functions

React makes a variety of [synthetic DOM
events](https://reactjs.org/docs/events.html) available to your component.
Events such as `onClick`, `onKeyPress`, `onSubmit`, etc. When specifying one of
these event handlers, you must supply a function.

To conditionally include an event handler, you may be tempted to do this:

```javascript
<Toggler
  onKeyPress={someCondition && handleKeyPress}
/>
```

This means that `onKeyPress` will receive `false` when `someCondition` is
`false`. That is a prop type violation. Instead, you should use a ternary
statement.

```javascript
<Toggler
  onKeyPress={someCondition ? handleKeyPress : undefined}
/>
```

If `someCondition` is `false`, then the prop will be set as `undefined` and
that prop won't be defined.
