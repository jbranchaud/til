# Creating A 2D Array

In most languages if I wanted to create a two-dimensional array, I would
utilize some nested looping construct to generate columns of rows. The
[ReasonML `Array` module](https://reasonml.github.io/api/Array.html)
abstracts this away.

```reason
let grid = Array.make_matrix(10, 10, 0);

grid
|> Array.iter(column => {
  column
  |> Array.iter(cell => {
    print_int(cell);
  });
  print_endline("");
});

/*
0000000000
0000000000
0000000000
0000000000
0000000000
0000000000
0000000000
0000000000
0000000000
0000000000
*/
```

The `make_matrix` function allows you to specify dimensions of a
two-dimensional array with all positions initialized to the same value --
that third argument.
