# Create A Cancelable Promise With PCancelable

If an async task takes a really long time and we find out in the middle of
its execution that we no longer want the results of that activity, it would
be nice to be able to cancel that promise. There was a [proposal for
cancelable promises](https://github.com/tc39/proposal-cancelable-promises),
but it has since been withdrawn. There is an alternative though.

The [`p-cancelable`](https://github.com/sindresorhus/p-cancelable) package
provides a promise wrapper that acts as a cancelable promise.

```javascript
import PCancelable from 'p-cancelable';

const fetchPromise = new PCancelable((resolve, reject, onCancel) => {
  setTimeout(() => {
    resolve({ ok: true, data: [1, 2, 3] });
  }, 10000);

  onCancel(() => {
    console.log('Promise is being canceled');
  });
});

fetchPromise.then(response => {
  console.log('Promise Resolved: ', response.data);
}).catch(err => {
  console.log('Promise Rejected: ', err);
});

fetchPromise.cancel();
```

We can create a promise in a familiar manner. We get an additional argument
-- the `onCancel` function. This is a function that will be executed if
`cancel` is called before the promises has resolved or rejected. In the
above example, the `fetchPromise.cancel()` line will be invoked before the
`setTimeout` resolves. The promise will be canceled, causing a rejection
which will push us into the `catch` handler.
