# Spelunking Through Components With Enzyme's Dive

Most of the components we write have other components nested in them.

```javascript
const Hello = ({ name }) => <h1>Hello {name}!</h1>;

const HelloContainer = (props) => (
  <div>
    <Hello {...props} />
  </div>
);
```

If we are to [shallow render the above component using
Enzyme](http://airbnb.io/enzyme/docs/api/ShallowWrapper/shallow.html), we'll
only see things one layer deep:

```javascript
const wrapper = shallow(<HelloContainer name="World" />);
// wrapper ~= <div><Hello name="World" /></div>
```

If we'd like to explore a particular child of the rendered component
further, we can do a little
[`find`](http://airbnb.io/enzyme/docs/api/ReactWrapper/find.html) and
[`dive`](http://airbnb.io/enzyme/docs/api/ShallowWrapper/dive.html).

```javascript
const wrapper = shallow(<HelloContainer name="World" />);
const helloWrapper = wrapper.find(Hello).dive();
expect(helloWrapper.text()).toEqual("Hello World!");
```

This allows us to make pinpoint assertions about how our components render
without mounting the entire thing.

See a [live example here](https://codesandbox.io/s/y236wr1kn1).

h/t Vidal Ekechukwu
