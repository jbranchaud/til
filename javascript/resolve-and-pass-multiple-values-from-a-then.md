# Resolve And Pass Multiple Values From A Then

Let's say you are chaining multiple async function calls together.

```javascript
fetchTrainer(trainerName)
  .then(response => {
    const trainerData = response.body;

    return fetchPokemonFor({ trainerId: trainerData.id });
  })
  .then(response => {
    // I want trainerData, but it is now out of scope...
  });
```

But in the last `then()` you want access to both the `trainerData` and the
`pokemonData`. So, how do you pass both the `trainerData` and the resolved
response of `fetchPokemonFor()` through to that last `then()`.

```javascript
fetchTrainer(trainerName)
  .then(response => {
    const trainerData = response.body;

    return Promise.all([
      trainerData,
      fetchPokemonFor({ trainerId: trainerData.id })
    ]);
  })
  .then(([trainerData, pokemonResponse]) => {
    const pokemonData = pokemonResponse.body;

    // do something with trainerData and pokemonData
  });
```

`Promise.all` allows us to resolve and pass multiple promises. If any of the
values in the array argument is not a promise, it simply passes it through.

h/t Brian Dunn
