# Sleep For A Bit In Async Code

A `sleep` utility function can be useful in a variety of situations. From
testing and debugging to simulating a delay in development.

Here is what that function can look like in its simplest form:

```javascript
function sleep(time) {
  return new Promise((resolve) => {
    setTimeout(resolve, time)
  })
}
```

This function returns a promise that will resolve after the given number of
milliseconds.

As an example of how to use it, here is how we can simulate a delay in a fake
fetch function.

```javascript
async function fakeUserFetch(userId) {
  # add half a second of "network" latency
  await sleep(500)

  const fakeResponse = {
    id: userId,
    email: "fake-email@example.com"
  }

  return Promise.resolve(fakeResponse)
}
```

[source](https://stackoverflow.com/a/951057/535590)
