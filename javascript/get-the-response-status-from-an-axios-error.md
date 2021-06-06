# Get The Response Status From An Axios Error

You can make API requests with [`axios`](https://github.com/axios/axios). If
the request fails because of a 4xx or 5xx response, an error will be raised.
The response to the request is stored on the error so that you can still access
the details of the response in your error handling logic.

Here is a snippet of code that details using async/await with `axios`. It wraps
the call in a `try/catch` block.

```javascript
async function getCharacter(characterId) {
  let response;

  try {
    response = await axios.get(
      `https://rickandmortyapi.com/api/character/${characterId}`
    );
  } catch (e) {
    response = e.response;
  }

  console.log(response.status);

  // You can also access the response data
  // console.log(response.data);
}

getCharacter(2);
//=> 200

getCharacter(2000);
//=> 404
```

In the case of the second call that results in a 404 response, the `catch`
block is executed. This pulls the `response` off the error (`e`).

Just like the standard response, the response from the error contains `status`,
`data`, `headers`, etc.

This also works with a promise-based control flow.

[Live Example](https://codesandbox.io/s/ancient-currying-5cmgm?file=/src/index.js)
