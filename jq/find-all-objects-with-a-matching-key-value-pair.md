# Find All Objects With A Matching Key Value Pair

Let's say I have a JSON file representing a bunch of people's reading lists.
That means it is an array of objects where each object is a person's reading
profile and contains a _list_ of books. Some of those books have a _status_ of
`reading` meaning the person is currently reading that book.

How can we find all books that are currently being read?

```
jq '. | map(
      {
        name: .username,
        in_progress_books: (.books | map(select(.status == "reading")))
      }
    )'
```

```
[
  { name: 'bobr', in_progress_books: [...] },
  { name: 'sallyf', in_progress_books: [...] },
  ...
]
```

That will show us for each reader what books they are currently reading.

Alternatively, we could roll that all up into a single list of books.

```
jq '. |
      map(.books | map(select(.status == "reading"))) |
      flatten'
```

```
[
  { title: 'Moby Dick', status: 'reading', ... }
  { title: 'The Great Gatsby', status: 'reading', ... }
  ...
]
```

[source](https://stackoverflow.com/a/18608100/535590)
