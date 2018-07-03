# Create A Stream From An Array

There are functions in the [`Stream`
module](https://reasonml.github.io/api/Stream.html) for turning a variety of
data structures into streams -- lists, input channels, etc.

What if you have an array?

The `Stream.from` function lets you define a function for custom fitting
data structures into streams. Let's take a look:

```reason
let pokemons = [| "bulbasaur", "charmander", "squirtle" |];

let poke_stream: Stream.t(string) =
  Stream.from(i =>
    switch (pokemons[i]) {
    | pokemon => Some(pokemon)
    | exception (Invalid_argument("index out of bounds")) => None
    }
  );
```

The function takes the current index and needs to either return `Some('a)`
with the corresponding value or `None` if the stream is empty.

With that, we now have a stream on which we can invoke any of the stream
functions.

```reason
switch (Stream.next(poke_stream)) {
| pokemon => print_endline(Printf.sprintf("Next Pokemon: %s", pokemon))
| exception Stream.Failure => print_endline("No pokemon left")
};
```
