# Specifying Dependencies Of A useEffect Hook

The `useEffect` hook is all about performing side-effects. For instance,
you'll want to place API calls within `useEffect` hooks.

The dependency array -- the second argument to `useEffect` -- is where you
declare all of the values that are depended on within the `useEffect`. If
you're making an API call, this array is likely made up of parameters passed to
that call.

Here is a contrived example of what that could look like:

```javascript
const apiCall = (opts) => Promise.resolve(opts);
const [param1, param2, param3] = [1,2,3];

useEffect(() => {
  const handleApiCall = async () => {
    apiCall({ param1, param2, param3 })
      .then((data) => {
        // do something with the data
      })
      .catch((error) => {
        // do something with the error
      });
  }

  handleApiCall();
}, [param1, param2, param3]);
```

If you don't specify all of the values used in the body of the `useEffect`, you
are opening yourself up to potentially incorrect code. It is safer to specify
all of them. The [`exhaustive-deps`
rule](https://www.npmjs.com/package/eslint-plugin-react-hooks) can help.

[This
section](https://overreacted.io/a-complete-guide-to-useeffect/#what-happens-when-dependencies-lie)
of Dan Abramov's "A Complete Guide to useEffect" does an excellent job of
showing how things can go wrong when you lie to React about your dependencies.
