# Two Ways To Find An Item In A List

The `List` module has the typical `find` function that you'd expect any
enumerable type to include. It has a very similar `find_opt` function as
well. The difference is in the return types.

When using `List.find` you'll have to deal with the possibility of a
`Not_found` exception.

```reasonml
switch (List.find(item => item.id == id, my_list)) {
| exception Not_found => print_endline("Not found!")
| item => print_endline("Found it: " ++ item.name)
}
```

The `List.find_opt` function has a more familiar interface that doesn't
require you to know the details of what exceptions could arise. All you want
to know is if it was found or _not_. This is achieved by having an
`option('a)` return type.

```reasonml
switch (List.find_opt(item => item.id == id, my_list)) {
| None => print_endline("Not found!")
| Some(item) => print_endline("Found it: " ++ item.name)
}
```

See the [`List` module](https://reasonml.github.io/api/List.html) for more
details.
