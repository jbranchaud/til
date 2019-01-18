# Destructure With Access To Nested Value And Parent Value

A destructuring pattern that I often see (especially in React code) is to
peel off a nested value in the argument declaration of a function.

```javascript
const Component = ({ data: { name: displayName }}) => {
  return (
    <div>
      <h1>{displayName}</h1>
      <SubComponent />
    </div>
  );
};
```

On its own this works quite well, but what happens when you need access to
the full set of `data` as well as the nested `name` value? I often see this.

```javascript
const Component = ({ data }) => {
  const { name: displayName } = data;
  return (
    <div>
      <h1>{displayName}</h1>
      <SubComponent data={data} />
    </div>
  );
};
```

ES6 destructuring is flexible. You can skip the `const` line and keep
everything in the argument declaration.

```javascript
const Component = ({ data: { name: displayName }, data }) => {
  return (
    <div>
      <h1>{displayName}</h1>
      <SubComponent data={data} />
    </div>
  );
};
```

You can re-reference the `data` value after the nested destructuring.
