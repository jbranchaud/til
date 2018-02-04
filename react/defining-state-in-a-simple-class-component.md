# Defining State In A Simple Class Component

Most class components start off with a constructor which does some
initialization of the component including setting the components initial
state. It might look something like the following:

```javascript
class MyComponent extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      loading: true
    };
  }

  render() {
    if (this.state.loading) {
      return (
        <p>Loading...</p>
      );
    } else {
      // ...
    }
  }
}
```

If setting state is the only thing you need to do in the constructor,
then you can skip the constructor all together.

```javascript
class MyComponent extends React.Component {
  state = {
    loading: true
  };

  render() {
    if (this.state.loading) {
      return (
        <p>Loading...</p>
      );
    } else {
      // ...
    }
  }
}
```

This second example will work the same as the first, and it is a bit more
concise.
