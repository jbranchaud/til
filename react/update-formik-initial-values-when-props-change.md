# Update Formik Initial Values When Props Change

When a [Formik](https://jaredpalmer.com/formik/) form mounts, whatever the
initial values are set to is what they will be. Even if the initial values are
computed from props, those props changing will not affect `initialValues` after
mount.

```javascript
const ZipForm = ({ currentZip }) => {
  return (
    <Formik
      initialValues={{ zip: currentZip }}
      onSubmit={(values, actions) => {
        // do stuff
      }}
      ...
```

If we are fetching the user's saved zip code asynchronously from a server while
the form is first being rendered, then `currentZip` will start as an empty
value. Once the async request comes back and `currentZip` is set, we won't see
the form update the `zip` field.

There was a time when you would have to jump through some hoops to make sure
the freshest prop value made it into the form. Now, Formik provides a handier
mechanism -- the `enableReinitialize` prop.

```javascript
const ZipForm = ({ currentZip }) => {
  return (
    <Formik
      initialValues={{ zip: currentZip }
      enableReinitialize
      onSubmit={(values, actions) => {
        // do stuff
      }}
      ...
```

By setting `enableReinitialize` to true, we are telling Formik that any prop
changes that flow into the `initialValues` object should cause those values to
be _reinitialized_.

See a [live example](https://codesandbox.io/s/sad-mendeleev-4dbbp).
