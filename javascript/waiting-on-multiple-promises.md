# Waiting On Multiple Promises

You may find yourself in a situation where you have to request multiple
resources from multiple API endpoints and then combine that data in some
way.

One way to achieve this would be with nested promises.

```javascript
fetch('/blogs').then((response) => {
  let blogs = response.body;

  fetch('/tags').then((response) => {
    let tags = response.body;

    // combine blogs and tags ...
  })
})
```

This nesting isn't ideal and it can get hard to read as the full
implementation is put into place.

The `Promise` API provides an alternative.

```javascript
let blogsPromise = fetch('/blogs')
let tagsPromise = fetch('/tags')

Promise.all([blogsPromise, tagsPromise]).then(([blogsResp, tagsResp]) => {
  // combine blogs and tags ...
})
```

With
[`Promise.all()`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise/all)
we are able to wrap any number of promises and wait for all of them to
resolve until we do something with the results. This allows us to create a
context in which we have all the data we need without a bunch of nesting.
