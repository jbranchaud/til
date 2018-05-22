# Forcing A Child Remount With The Key Prop

There are a couple `prop` names that have reserved usage in React. One of
those is `key`. We generally use `key` when we are rendering a list of
things. It is a way of uniquely identifying each element in a list so that
React minimizes re-rendering when parts of the list change.

We can flip this on its head and utilize `key` as a way of forcing a remount
and re-render of a child component.

Imagine I have a component that does a number of things including rendering
a component with some internal state, such as a counter.

```javascript
class MyComponent extends React.Component {
  state = {
    remountKey: (new Date()).getTime(),
  }

  resetCounter = () => {
    this.setState({
      remountKey: (new Date()).getTime(),
    });
  }

  render() {
    return (
      <div>
        {/* some other stuff in my component */}

        <Counter key={this.state.remountKey} />
        <button onClick={this.resetCounter}>Reset Counter</button>
      </div>
    );
  }
}
```

I can force this `Counter` component to remount, thus resetting its state by
passing it a new `key` value. The `button` can trigger this by updating the
`remountKey` value.
