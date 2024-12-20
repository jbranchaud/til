# Produce The Zero Value For A Generic Type

While writing a _pop_ function that would work with slices of a generic type, I
ran into the issue of needing to produce a zero value of type `T` when
returning early for an empty slice.

The way to arbitrarily get the zero value of a generic in Go is with `*new(T)`.

I was able to use this in my `Pop` function like so:

```go
func Pop[T any](slice []T) (T, error) {
	if len(slice) == 0 {
		return *new(T), fmt.Errorf("cannot pop an empty slice")
	}

	lastItem := slice[len(slice)-1]

	slice = slice[:len(slice)-1]

	return lastItem, nil
}
```

If this is happening in multiple functions and we want a more self-documenting
approach, we can pull it out into a function `zero`:

```go
func zero[T any]() T {
	return *new(T)
}
```
