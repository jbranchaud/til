# Destructure Variables As Props To A Component

When passing down props, a redundant-feeling pattern can sometimes emerge.

```javascript
const MyComponent = ({ handleChange, handleBlur }) => {
  return (
    <div>
      <OtherComponent />
      <MySubComponent handleChange={handleChange} handleBlur={handleBlur} />
    </div>
  )
};
```

The typing feel duplicative, as if there ought to be a better way. One
option is to simply pass down all the props:

```javascript
<MySubComponent {...props} />
```

This approach may result in passing down props that we don't intend to pass
down and clutters the flow of data in our app.

Here is another approach:

```javascript
const MyComponent = ({ handleChange, handleBlur }) => {
  return (
    <div>
      <OtherComponent />
      <MySubComponent {...{handleChange, handleBlur}} />
    </div>
  )
};
```

Here we are taking advantage of two ES6 features. Since the naming is the
same, we can use [property
shorthands](http://es6-features.org/#PropertyShorthand). Then we immediately
use the [spread operator](http://es6-features.org/#SpreadOperator) to splat
it back out as the props to the component.

h/t Vidal Ekechukwu
