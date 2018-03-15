# A Component Is Just A Bag Of Data

If you write enough React using JSX, it is easy to forget that you're not
working with markup. Everything -- `div`s, `h1`s, 3rd party components, your
components -- all get boiled down to JavaScript objects full of data.

Any given React component is really just a bag of data. Try doing a
`console.log` to see. Here is an example from an [earlier
post](https://github.com/jbranchaud/til/blob/master/react/dynamically-add-props-to-a-child-component.md).

```javascript
const ParentWithClick = ({ children }) => {
  return (
    <React.Fragment>
      {React.Children.map(children || null, (child, i) => {
        console.log(child);
        return <child.type {...child.props} key={i} onClick={handleClick} />;
      })}
    </React.Fragment>
  );
};

const App = () => (
  <div>
    <ParentWithClick>
      <span>Click this span</span>
    </ParentWithClick>
  </div>
);
```

Looking in the console, we see the following output:

```
Object {type: "span", key: null, ref: null, props: Object, _owner: Object…}
 type: "span"
 key: null
 ref: null
 props: Object
  children: "Click this span"
 _owner: Object
 _store: Object
```

It contains information about the component itself and because of the tree
structure of this data, you could potentially expand the `props` -->
`children` sections several times for certain components.

See a [live example here](https://codesandbox.io/s/l41pj382x7).
