# Stream A File Line By Line

We can use the `Stream` module in [ReasonML](https://reasonml.github.io/en)
to read a file getting each line on demand. Doing this requires two key
insights. First, we can open a file as an _input channel_. Second, we can
turn an input channel into a _stream_ using `Stream.from`.

```reason
let file_in_channel = Pervasives.open_in('file.txt');

let file_stream =
  Stream.from(_i => {
    switch(Pervasives.input_line(file_in_channel)) {
    | line => Some(line)
    | exception(End_of_file) => None
    };
  });

file_stream |> Stream.iter(line => do_something(line));
```

The `Pervasives` module (which is open by default and is only prefixed above
so as to be explicit) allow us to open the named file as an input channel
with `open_in`. It also allows us to read lines off that file with
`input_line`. We use `Stream.from` to create a custom stream that consumes
the input channel line by line using `input_line`. We either get _some_ line
or we hit the end of the file. Lastly, we can do whatever we want with the
stream, such as iterate over it.

See the docs for
[`Pervasives`](https://reasonml.github.io/api/Pervasives.html) and
[`Stream`](https://reasonml.github.io/api/Stream.html) for more details.
